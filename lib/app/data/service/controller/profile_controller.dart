import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:employee_attendance_flutter/app/core/utils/app_utils.dart';
import 'package:employee_attendance_flutter/app/core/utils/constants.dart';
import 'package:employee_attendance_flutter/app/core/utils/storage_utils.dart';
import 'package:employee_attendance_flutter/app/data/api/api_client.dart';
import 'package:employee_attendance_flutter/app/data/model/attendance_status_model.dart';
import 'package:employee_attendance_flutter/app/data/model/user_details_model.dart';
import 'package:employee_attendance_flutter/app/data/service/repository/home_repo.dart';
import 'package:employee_attendance_flutter/app/data/service/repository/profile_repo.dart';
import 'package:employee_attendance_flutter/app/modules/attendance/attandence_page.dart';
import 'package:employee_attendance_flutter/app/modules/home/home_page.dart';
import 'package:employee_attendance_flutter/app/modules/settings/setting_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../../../core/utils/dialog_helper.dart';
import '../../../modules/home/check_in_out_dialog_widget.dart';
import '../../api/api_path.dart';
import '../../api/error_handling.dart';
import '../../model/office_location_model.dart';

class ProfileController extends SuperController {
  static ProfileController get to => Get.find();

  //late final userDetails = Rxn<UserDetailsModel>();
  late final professional = Rxn<ProfessionalDetail>();
  late final userInfo = Rxn<UserDetails>();
  late final personalInfo = Rxn<PersonalDetail>();
  late final familyInfo = Rxn<FamilyDetail>();
  late final  bankInfo = Rxn<BankDetail>();
  late final  profileImage = Rxn<String>();


  //personal details controllers
  var emailController = TextEditingController(text: "");
  var phoneController = TextEditingController(text: "");
  var addressController = TextEditingController(text: "");
  var addressTypeController = TextEditingController(text: "");
  var dobController = TextEditingController(text: "");
  var bioController = TextEditingController(text: "");
  var genderController = TextEditingController(text: "");
  var bloodController = TextEditingController(text: "");

  //professional details controllers
  var designationController = TextEditingController(text: "");
  var experienceController = TextEditingController(text: "");
  var skillsController = TextEditingController(text: "");
  var joiningdateController = TextEditingController(text: "");
  var joiningExperienceController = TextEditingController(text: "");

  //family details controller
  var fatherNameController = TextEditingController(text: "");
  var motherNameController = TextEditingController(text: "");
  var personalEmailController = TextEditingController(text: "");
  var alternateContactController = TextEditingController(text: "");
  var familyaddressController = TextEditingController(text: "");

  //bank details controller
  var bankNameController = TextEditingController(text: "");
  var accountNoController = TextEditingController(text: "");
  var ifsccodeController = TextEditingController(text: "");
  var branchNameController = TextEditingController(text: "");
  var bankAddressNameController = TextEditingController(text: "");
  var pancardController = TextEditingController(text: "");
  var aadharcardController = TextEditingController(text: "");



  late List<TextEditingController> editControllers;
  late TextEditingController dobEditController= TextEditingController();
  final  genderEditController= "N/A".obs;
  final  bloogEditController= "N/A".obs;
  final  addressTypeEditController= "N/A".obs;
  static Map professionalBlockEditItems = {
    'Experience': '',
    'Skills': '',
  };

  DateTime selectedDate = DateTime.now();

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900, 1),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      dobEditController.text = "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
    }
  }

  static Map extraWidgetsPersonal = {
    'Address Type': '',
    'Date of birth': '',
    'Gender': '',
    'Blood Group': '',
  };


  static Map personalBlockEditItems = {
    'Bio': '',
    'Address1': '',
    'Address2': '',
    'Zipcode': '',
    'City': '',
    'State': '',
    'Country': '',
  };



  static Map familyBlockEditItems = {
    'Father Name': '',
    'Mother Name': '',
    'Personal Email': '',
    'Alternate Contact': '',
    'Family Address': '',
  };

  static Map bankBlockEditItems = {
    'Bank Name': '',
    'Account No.': '',
    'IFSC Code': '',
    'Branch Name': '',
    'Name as per Bank': '',
    'Pan No.': '',
    'AADHAR No.': '',
  };

  static const int userUpdate = 0;
  static const int professionalUpdate = 1;
  static const int personalUpdate = 2;
  static const int familyUpdate = 3;
  static const int bankUpdate = 4;


  Map getProfessionalEditItems() {
    professionalBlockEditItems.update("Experience", (value) => professional.value?.experience??"");
    professionalBlockEditItems.update("Skills", (value) => professional.value?.skills??"");
    return professionalBlockEditItems;
  }


  Map getPersonalEditItems() {
    personalBlockEditItems.update("Bio", (value) => personalInfo.value?.bio??"");
    personalBlockEditItems.update("Address1", (value) => personalInfo.value?.address??"");
    personalBlockEditItems.update("Address2", (value) => personalInfo.value?.address2??"");
    personalBlockEditItems.update("Zipcode", (value) => personalInfo.value?.zipcode??"");
    personalBlockEditItems.update("City", (value) => personalInfo.value?.city??"");
    personalBlockEditItems.update("State", (value) => personalInfo.value?.state??"");
    personalBlockEditItems.update("Country", (value) => personalInfo.value?.country??"");
    return personalBlockEditItems;
  }

  Map getExtrasEditItems() {
    dobEditController.text = personalInfo.value?.dob??"";
    addressTypeEditController.value = personalInfo.value?.addresstype??"N/A";
    bloogEditController.value = "N/A";
    genderEditController.value = personalInfo.value?.gender == "ML"
        ? "Male"
        : personalInfo.value?.gender == "FL"
        ? "Female"
        : "N/A";
    extraWidgetsPersonal.update("Date of birth", (value) => personalInfo.value?.dob??"");
    extraWidgetsPersonal.update("Address Type", (value) => personalInfo.value?.addresstype??"N/A");
    extraWidgetsPersonal.update("Blood Group", (value) => "N/A");
    extraWidgetsPersonal.update("Gender", (value) => personalInfo.value?.gender == "ML"
        ? "Male"
        : personalInfo.value?.gender == "FL"
        ? "Female"
        : "N/A");
    return extraWidgetsPersonal;
  }


  Map getFamilyEditItems() {
    familyBlockEditItems.update("Father Name", (value) => familyInfo.value?.fathername??"");
    familyBlockEditItems.update("Mother Name", (value) => familyInfo.value?.mothername??"");
    familyBlockEditItems.update("Personal Email", (value) => familyInfo.value?.personalemail??"");
    familyBlockEditItems.update("Alternate Contact", (value) => familyInfo.value?.alternatecontact??"");
    familyBlockEditItems.update("Family Address", (value) => familyInfo.value?.familyaddress??"");
    return familyBlockEditItems;
  }


  Map getBankBlockEditItems() {
    bankBlockEditItems.update("Bank Name", (value) => bankInfo.value?.bankname??"");
    bankBlockEditItems.update("Account No.", (value) => bankInfo.value?.accountno??"");
    bankBlockEditItems.update("IFSC Code", (value) => bankInfo.value?.ifsccode??"");
    bankBlockEditItems.update("Branch Name", (value) => bankInfo.value?.branchname??"");
    bankBlockEditItems.update("Name as per Bank", (value) => bankInfo.value?.bankaddress??"");
    bankBlockEditItems.update("Pan No.", (value) => bankInfo.value?.pancard??"");
    bankBlockEditItems.update("AADHAR No.", (value) => bankInfo.value?.aadharcard??"");
    return bankBlockEditItems;
  }

  List getEditedData(){
    List dataArray = List.empty(growable: true);
    for (var element in editControllers) {
      dataArray.add(element.text);
    }
   return dataArray;
  }

  void updatePersonalDetails() async {
    DialogHelper.showLoading();
    AppUtils.printMessage("Uploading Personal Data...");
    List dataArray = getEditedData();
    try {
      Map<String,String> body = {
        "userid": userInfo.value?.userid??"",
        "gender": genderEditController.value == "Male"
            ? "ML"
            : genderEditController.value == "Female"
                ? "FL"
                : "N/A",
        "mime_type" : personalInfo.value?.mimetype??"",
        "bio": dataArray[0],
        "dob": dobEditController.text,
        "address": dataArray[1],
        "address2": dataArray[2],
        "zipcode": dataArray[3],
        "address_type": addressTypeEditController.value,
        "city": dataArray[4],
        "state": dataArray[5],
        "country": dataArray[6]
      };

        await ProfileRepository().updateProfile(body,APIPath.kPostProfilePersonalData).then((value) {
          closeScreen();

        });
    } catch (e) {
      return Future.error(e);
    }
  }


  void updateProfessionalDetails() async {
    DialogHelper.showLoading();
    AppUtils.printMessage("Uploading Professional Data...");
    List dataArray = getEditedData();
    try {
      Map<String,String> body = {
        "userid": userInfo.value?.userid??"",
        "designation":professional.value?.designation??"",
        "experience":dataArray[0],
        "skills":  dataArray[1],
        "joining_date":  professional.value?.joiningdate??"",
        "termination_date":  professional.value?.terminationdate??"",
        "termination_reason": professional.value?.terminationreason??""
      };
      await ProfileRepository().updateProfile(body,APIPath.kPostProfileProfessional).then((value) {
        closeScreen();
      });
    } catch (e) {
      return Future.error(e);
    }
  }

  void updateFamilyDetails() async {
    DialogHelper.showLoading();
    AppUtils.printMessage("Uploading Family Data...");
    List dataArray = getEditedData();
    try {
      Map<String,String> body = {
        "userid":  userInfo.value?.userid??"",
        "father_name": dataArray[0],
        "mother_name": dataArray[1],
        "personal_email": dataArray[2],
        "alternate_contact": dataArray[3],
        "family_address":dataArray[4]
      };
      await ProfileRepository().updateProfile(body,APIPath.kPostProfileFamily).then((value) {
        closeScreen();
      });
    } catch (e) {
      return Future.error(e);
    }
  }

  void updateBankDetails() async {
    DialogHelper.showLoading();
    AppUtils.printMessage("Uploading Bank Data...");
    List dataArray = getEditedData();
    try {
      Map<String,String> body = {
        "userid": userInfo.value?.userid??"",
        "bank_name": dataArray[0],
        "account_no": dataArray[1],
        "ifsc_code": dataArray[2],
        "pan_card": dataArray[5],
        "branch_name":dataArray[3],
        "bank_address": dataArray[4],
        "aadhar_card": dataArray[6]
      };
      await ProfileRepository().updateProfile(body,APIPath.kPostProfileBank).then((value) {
        closeScreen();
      });
    } catch (e) {
      return Future.error(e);
    }
  }

  void updateProfile(int updateAction) {
    switch (updateAction) {
      case professionalUpdate:
        {
          updateProfessionalDetails();
          break;
        }
      case personalUpdate:
        {
          updatePersonalDetails();
          break;
        }
      case familyUpdate:
        {
          updateFamilyDetails();
          break;
        }
      case bankUpdate:
        {
         updateBankDetails();
          break;
        }
    }
  }

  void closeScreen(){
    DialogHelper.dismissLoader();
    Get.back();
    getUserData();
}

  @override
  void onReady() {
    super.onReady();
    getUserData();
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
    AppUtils.printMessage('ResumeInvoked');
  }

  void getUserData() async {
    try {
      DialogHelper.showLoading();
      HomeRepository().getUserInfo().then((value) {
        DialogHelper.dismissLoader();
        var js = jsonDecode(value);
        UserDetailsModel userDetailsModel = UserDetailsModel.fromJson(js);
        //userDetails(userDetailsModel);
        if (userDetailsModel.data?.isNotEmpty == true) {
          userInfo(userDetailsModel.data?[0]);
          StorageUtils.instance.setFullName("${userDetailsModel.data?[0]?.firstname ?? "Unknown user"} ${userDetailsModel.data?[0]?.lastname??""}");
        }
        if (userDetailsModel.professionalDetails?.isNotEmpty == true) {
          professional(userDetailsModel.professionalDetails?[0]);
          StorageUtils.instance.setDesignation(userDetailsModel.professionalDetails?[0]?.designation??"Unknown profession");
        }
        if (userDetailsModel.personalDetails?.isNotEmpty == true) {
          personalInfo(userDetailsModel.personalDetails?[0]);
          String path = APIPath.kProfilePicPrefix+(userDetailsModel.personalDetails?[0]?.src??"");
          StorageUtils.instance.setProfilePic(path);
          profileImage(path);
        }

        if (userDetailsModel.familyDetails?.isNotEmpty == true) {
          familyInfo(userDetailsModel.familyDetails?[0]);
        }
        if (userDetailsModel.bankDetails?.isNotEmpty == true) {
          bankInfo(userDetailsModel.bankDetails?[0]);
        }
        setControllers();
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

  void setControllers() {
    //personal details controller
    emailController.text = userInfo.value?.email ?? "email unavailable";
    phoneController.text = userInfo.value?.phonenumber ?? "phone unavailable";
    addressController.text =
        "${personalInfo.value?.address ?? ""}, ${personalInfo.value?.address2 ?? ""}\n${personalInfo.value?.city ?? ""}\n${personalInfo.value?.state ?? ""} - ${personalInfo.value?.zipcode ?? ""}";
    addressTypeController.text = personalInfo.value?.addresstype ?? "unavailable";
    dobController.text = personalInfo.value?.dob ?? "unavailable";
    bioController.text = personalInfo.value?.bio ?? "unavailable";
    bloodController.text =  "unavailable";
    genderController.text = personalInfo.value?.gender == "ML"
        ? "MALE"
        : personalInfo.value?.gender == "FL"
            ? "FEMALE"
            : "unavailable";

    //professional details controller
    designationController.text =
        professional.value?.designation ?? "unavailable";
    int exp = int.parse(professional.value?.experience??"0");
    int inYear = exp~/12;
    int inMonths = exp%12;
    String experience = "$inYear Year $inMonths Months";
    experienceController.text = experience;
    skillsController.text = professional.value?.skills ?? "unavailable";
    joiningdateController.text = AppUtils.getStandardFormat(professional.value?.joiningdate ?? "");
    joiningExperienceController.text =  AppUtils.getYearMonthFromDays(AppUtils.calculateDifference(AppUtils.parseDateTimeFromString(professional.value?.joiningdate??"")));


    //family details controller
    fatherNameController.text = familyInfo.value?.fathername ?? "unavailable";
    motherNameController.text = familyInfo.value?.mothername ?? "unavailable";
    personalEmailController.text =
        familyInfo.value?.personalemail ?? "unavailable";
    alternateContactController.text =
        familyInfo.value?.alternatecontact ?? "unavailable";
    familyaddressController.text =
        familyInfo.value?.familyaddress ?? "unavailable";

    //bank details controller
    bankNameController.text = bankInfo.value?.bankname ?? "unavailable";
    accountNoController.text = bankInfo.value?.accountno ?? "unavailable";
    ifsccodeController.text = bankInfo.value?.ifsccode ?? "unavailable";
    branchNameController.text = bankInfo.value?.branchname ?? "unavailable";
    bankAddressNameController.text =
        bankInfo.value?.bankaddress ?? "unavailable";
    pancardController.text = bankInfo.value?.pancard ?? "unavailable";
    aadharcardController.text = bankInfo.value?.aadharcard ?? "unavailable";
  }
}
