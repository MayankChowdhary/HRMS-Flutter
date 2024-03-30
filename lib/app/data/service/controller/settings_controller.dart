import 'dart:convert';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:employee_attendance_flutter/app/core/colors/colors.dart';
import 'package:employee_attendance_flutter/app/core/utils/app_utils.dart';
import 'package:employee_attendance_flutter/app/data/model/attendance_model.dart';
import 'package:employee_attendance_flutter/app/data/service/repository/attendance_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../core/utils/dialog_helper.dart';
import '../../../core/utils/dimensions.dart';
import '../../api/error_handling.dart';

class SettingsController extends GetxController with StateMixin<dynamic> {
  static SettingsController get to => Get.find();

  final versionName = "0.0.0".obs;

  @override
  void onReady() {
    super.onReady();
    getPackageInfo();
    getDeviceInfo();
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
       var deviceInfoPlugin =  await DeviceInfoPlugin().androidInfo;
       var androidSdkInt = deviceInfoPlugin.version.sdkInt;
       var brand = deviceInfoPlugin.brand;
       AppUtils.printMessage("androidSdkInt  $androidSdkInt");
       AppUtils.printMessage("brand  $brand");
  }
}
