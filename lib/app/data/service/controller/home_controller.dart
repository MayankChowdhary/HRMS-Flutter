import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:employee_attendance_flutter/app/core/utils/NotificationManagers.dart';
import 'package:employee_attendance_flutter/app/core/utils/app_utils.dart';
import 'package:employee_attendance_flutter/app/core/utils/constants.dart';
import 'package:employee_attendance_flutter/app/core/utils/storage_utils.dart';
import 'package:employee_attendance_flutter/app/data/model/attendance_status_model.dart';
import 'package:employee_attendance_flutter/app/data/model/user_details_model.dart';
import 'package:employee_attendance_flutter/app/data/service/repository/home_repo.dart';
import 'package:employee_attendance_flutter/app/data/service/repository/notification_repo.dart';
import 'package:employee_attendance_flutter/app/modules/attendance/attandence_page.dart';
import 'package:employee_attendance_flutter/app/modules/home/home_page.dart';
import 'package:employee_attendance_flutter/app/modules/settings/setting_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:vibration/vibration.dart';

import '../../../core/utils/dialog_helper.dart';
import '../../../core/utils/show_custom_snackbar.dart';
import '../../../modules/home/check_in_out_dialog_widget.dart';
import '../../../modules/notifications/notification_display_page.dart';
import '../../api/api_path.dart';
import '../../api/error_handling.dart';
import '../../model/office_location_model.dart';

class HomeController extends SuperController  {
  static HomeController get to => Get.find();

  final messaging = FirebaseMessaging.instance;
  final versionName = "0.0.0".obs;
  final userDetails = Rxn<UserDetails>();
  final professionDetails = Rxn<ProfessionalDetail>();
  final personalDetails = Rxn<PersonalDetail>();
  final officeLocationData = Rxn<OfficeLocation>();
  final attendanceStatus = Rxn<AttendanceStatus>();
  final isCheckedIn = false.obs;
  final isRemoteUser = false.obs;
  final checkInTime = "00:00".obs;
  final checkOutTime = "00:00".obs;
  final totalHours = "00:00".obs;
  var address = 'Getting Address..'.obs;
  late Position currentLatLang;
  final distanceFromOffice = 0.0.obs;
  bool isUserInRadius = false;
  var selectedIndex = 0.obs;
  String deviceOS="";
  String deviceName="";
  String oSVersion="";

  List<Widget> pages = [
    const HomePage(),
    const AttendancePage(),
    const NotificationDisplayPage(),
    const SettingPage(),
  ];

  void onTap(int index) {
    selectedIndex(index);
    update();
    if(index==0){
      onReady();
    }
  }

  @override
  void onReady() {
    super.onReady();
    getDeviceInfo();
    getNotificationPermission();
    getUserData();
    getOfficeLocation();
    getLocation();
    getAttendanceStatus(false);
    getPackageInfo();
  }

  @override
  void onDetached() {
    AppUtils.printMessage('DetachInvoked');
  }

  @override
  void onInactive() {
    AppUtils.printMessage('InactiveInvoked');
  }

  @override
  void onPaused() {
    AppUtils.printMessage('PauseInvoked');
  }

  @override
  void onResumed() {
    getAttendanceStatus(false);
    AppUtils.printMessage('ResumeInvoked');
  }

  void getUserData() async {
    try {
      DialogHelper.showLoading();
      HomeRepository().getUserInfo().then((value) {
        DialogHelper.dismissLoader();
        var js = jsonDecode(value);
        UserDetailsModel userRoot = UserDetailsModel.fromJson(js);
        if (userRoot.data?.isNotEmpty == true) {
          UserDetails? userDetail = userRoot.data?[0];
          userDetails.value = userDetail;
          isRemoteUser(userDetail?.worklocation == "wfh");
          StorageUtils.instance.setFullName("${userDetail?.firstname ?? "Unknown user"} ${userDetail?.lastname??""}");
        }

        if (userRoot.professionalDetails?.isNotEmpty == true) {
          ProfessionalDetail? professionalInfo =
              userRoot.professionalDetails?[0];
          professionDetails.value = professionalInfo;
          StorageUtils.instance.setDesignation(professionalInfo?.designation??"Unknown profession");
        }
        if (userRoot.personalDetails?.isNotEmpty == true) {
          PersonalDetail? personalDetail = userRoot.personalDetails?[0];
          personalDetails.value = personalDetail;
          String path = APIPath.kProfilePicPrefix+(personalDetail?.src??"");
          StorageUtils.instance.setProfilePic(path);
        }
        update();
        postDeviceToken();
      }, onError: (e) {
        DialogHelper.dismissLoader();
        ErrorHandling.handleErrors(e);
      });
    } catch (e) {
      DialogHelper.dismissLoader();
      ErrorHandling.handleErrors(e);
    }
  }

  void getOfficeLocation() async {
    try {
      DialogHelper.showLoading();
      HomeRepository().getOfficeLocation().then((value) {
        DialogHelper.dismissLoader();
        var js = jsonDecode(value);
        OfficeLocationRoot officeLocationRoot = OfficeLocationRoot.fromJson(js);
        OfficeLocation? officeLocation = officeLocationRoot.data?[0];
        officeLocationData.value = officeLocation;
        isLocationInRadius();
      }, onError: (e) {
        DialogHelper.dismissLoader();
        ErrorHandling.handleErrors(e);
      });
    } catch (e) {
      DialogHelper.dismissLoader();
      ErrorHandling.handleErrors(e);
    }
  }

  void getAttendanceStatus(bool showMessage) async {
    try {
      DialogHelper.showLoading();
      HomeRepository().getAttendanceStatus().then((value) {
        DialogHelper.dismissLoader();
        if (showMessage) {
          if (!isCheckedIn.value) {
            CheckInDialog.showDialog(
                false, AppUtils.isTimePassed(AppConstants.kShiftStartTime));
          } else {
            CheckInDialog.showDialog(true, false);
          }
        }
        var js = jsonDecode(value);
        AttendanceStatusModel attendanceStatusModel =
            AttendanceStatusModel.fromJson(js);
        if (attendanceStatusModel.data?.isNotEmpty == true) {
          AttendanceStatus? attendance = attendanceStatusModel.data?[0];
          attendanceStatus.value = attendance;
          checkInTime.value = attendance?.intime ?? "00:00";
          checkOutTime.value = attendance?.outtime ?? "00:00";
          totalHours.value = attendance?.totalhours ?? "00:00";
          if (checkInTime.value != "00:00:00" || checkInTime.value != "00:00") {
            isCheckedIn.value = true;
          }else{
            isCheckedIn.value = false;
          }
        }
        update();
      }, onError: (e) {
        DialogHelper.dismissLoader();
        ErrorHandling.handleErrors(e);
      });
    } catch (e) {
      DialogHelper.dismissLoader();
      ErrorHandling.handleErrors(e);
    }
  }

  void isLocationInRadius() {
    try {
      String officeLatString =
          officeLocationData.value?.latitude.toString() ?? "";
      String officeLngString =
          officeLocationData.value?.longitude.toString() ?? "";
      double officeLat = double.parse(officeLatString);
      double officeLng = double.parse(officeLngString);
      var currentLat = currentLatLang.latitude;
      var currentLng = currentLatLang.longitude;
      distanceFromOffice(Geolocator.distanceBetween(
        officeLat,
        officeLng,
        currentLat,
        currentLng,
      ));
      AppUtils.printMessage("User In currentLat: $currentLat");
      AppUtils.printMessage("User In currentLng: $currentLng");

      AppUtils.printMessage("User In Radius: $distanceFromOffice");
      if (distanceFromOffice <= AppConstants.kCheckInDistance) {
         isUserInRadius = true;
      }else{
        isUserInRadius = false;
      }
    } catch (e) {
      AppUtils.printMessage(e.toString());
    }
  }

  void createAttendance() async {
    try {
      DialogHelper.showLoading();
      String latLang =
          "[${currentLatLang.latitude},${currentLatLang.longitude}]";
      await HomeRepository().createAttendance(address.value, latLang).then(
          (value) {
        getAttendanceStatus(true);
      }, onError: (e) {
        DialogHelper.dismissLoader();
        ErrorHandling.handleErrors(e);
      });
    } catch (e) {
      DialogHelper.dismissLoader();
      ErrorHandling.handleErrors(e);
    }
  }


  getLocation() async {
    bool serviceEnabled;

    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        getLocation();
        return Future.error('Location permissions are denied');
      } else if (permission == LocationPermission.deniedForever) {
        Future.delayed(const Duration(milliseconds: 1500), () {
          ErrorHandling.showErrorWithAction(
              "ERROR",
              "Please grant location permission first from app settings",
              'Open Settings',
              ErrorHandling.LOCATION_SETTING_ACTION);
        });
        // Permissions are denied forever, handle appropriately.
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      ErrorHandling.showErrorWithAction(
          "ERROR",
          "Please grant location permission first from app settings",
          'Open Settings',
          ErrorHandling.LOCATION_SETTING_ACTION);
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    Geolocator.getPositionStream().listen((Position position) {
      currentLatLang = position;
      isLocationInRadius();
      getAddressFromLatLang(position);
    });
  }

  Future<void> getAddressFromLatLang(Position position) async {
    List<Placemark> placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemark[0];
    address.value = '${place.subLocality} - ${place.locality}';
    update();
  }

  void getPackageInfo() {
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      /* String appName = packageInfo.appName;
        String packageName = packageInfo.packageName;
       String buildNumber = packageInfo.buildNumber;
      */
      AppUtils.printMessage("Version: ${packageInfo.version}");
      versionName(packageInfo.version);
      update();
    });
  }

  Future<void> getDeviceInfo() async {
    if (Platform.isAndroid) {
      deviceOS = "Android";
      var deviceInfoPlugin = await DeviceInfoPlugin().androidInfo;
      //var androidSdkInt = deviceInfoPlugin.version.sdkInt;
      deviceName = "${deviceInfoPlugin.brand} ${deviceInfoPlugin.model}";
      oSVersion = deviceInfoPlugin.version.release;
    } else if (Platform.isIOS) {
      deviceOS = "IOS";
      var deviceInfoPlugin = await DeviceInfoPlugin().iosInfo;
      deviceName =  deviceInfoPlugin.model.toString();
      oSVersion = deviceInfoPlugin.systemVersion.toString();
    }
    AppUtils.printMessage("deviceName  $deviceName");
    AppUtils.printMessage("oSVersion  $oSVersion");
  }

  //firebase push notification code
  void postDeviceToken() async {
    try {
      String? token = await NotificationRepository().getFirebaseToken();
      AppUtils.printMessage('Firebase Token=$token');
      await NotificationRepository().postDeviceToken(userDetails.value?.userid,token,deviceOS, deviceName, oSVersion).then((value) {
        registerNotificationListener();
      });
    } catch (e) {
      AppUtils.printMessage(e.toString());
    }
  }

  Future<void> getNotificationPermission() async {
    final settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    AppUtils.printMessage('Permission granted: ${settings.authorizationStatus}');
  }
  void registerNotificationListener(){
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      NotificationManagers.showNotification(message);
    });
  }

  @override
  void onHidden() {
    // TODO: implement onHidden
  }
}
