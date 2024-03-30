import 'dart:convert';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:employee_attendance_flutter/app/core/colors/colors.dart';
import 'package:employee_attendance_flutter/app/core/utils/app_utils.dart';
import 'package:employee_attendance_flutter/app/core/utils/constants.dart';
import 'package:employee_attendance_flutter/app/data/model/attendance_model.dart';
import 'package:employee_attendance_flutter/app/data/model/regularization_model.dart';
import 'package:employee_attendance_flutter/app/data/model/resignation_model.dart';
import 'package:employee_attendance_flutter/app/data/service/repository/attendance_repo.dart';
import 'package:employee_attendance_flutter/app/data/service/repository/regularization_repo.dart';
import 'package:employee_attendance_flutter/app/data/service/repository/resignation_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../core/utils/dialog_helper.dart';
import '../../../core/utils/dimensions.dart';
import '../../api/error_handling.dart';

class ResignationController extends SuperController {
  static ResignationController get to => Get.find();

  var emailController = TextEditingController(text: "");
  var applyDateController = TextEditingController(text: "");
  var resignDateController = TextEditingController(text: "");
  var reasonController = TextEditingController(text: "");
  final resignationX = Rxn<List<Resignation>>();
  final tableData = Rxn<List<List<String>>>([]);

  var userId = "";
  var attId = "";

  @override
  void onReady() {
    super.onReady();
    getResignation();
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

  void setResignationDate(){
    applyDateController.text = AppUtils.getCurrentDateInverse();
    resignDateController.text = AppUtils.getAddedDays(AppConstants.kResignationDays);
  }

  void applyResignation() {
    DialogHelper.showLoading();
    try {
      Map<String, String> body = {
        "userid": userId,
        "email": emailController.text,
        "applied_date": applyDateController.text,
        "resign_date": resignDateController.text,
        "reason": reasonController.text
      };
      ResignationRepository().applyResignation(body).then((value) {
        DialogHelper.dismissLoader();
        Get.back();
        Get.snackbar("Resignation", "Applied successfully");
      }, onError: (e) {
        DialogHelper.dismissLoader();
        ErrorHandling.handleErrors(e);
      });
    } catch (e) {
      DialogHelper.dismissLoader();
      ErrorHandling.handleErrors(e);
      AppUtils.printMessage(e.toString());
    }
  }

  void getResignation() async {
    try {
      DialogHelper.showLoading();
      ResignationRepository().getResignation().then((value) {
        var js = jsonDecode(value);
        ResignationRoot resignationRoot = ResignationRoot.fromJson(js);
        List<Resignation?>? resignations = resignationRoot.data;
        resignationX.value = resignations?.cast<Resignation>();
        getTableData(resignationX.value);
        DialogHelper.dismissLoader();
      }, onError: (e) {
        DialogHelper.dismissLoader();
        ErrorHandling.handleErrors(e);
      });
    } catch (e) {
      DialogHelper.dismissLoader();
      ErrorHandling.handleErrors(e);
    }
  }

  void getTableData(List<Resignation>?  resignation){
    List<List<String>> tempData = [];
    if(resignation!=null) {
      for (var element in resignation) {
        AppUtils.printMessage("Adding items: ${element.applieddate}");
        tempData.add([
          element.id.toString(),
          element.email.toString().toString(),
          element.resigndate.toString(),
          element.reason.toString(),
          element.applieddate.toString(),
          element.status.toString()
        ]);
      }
      tableData.value = tempData;
      update();
    }
  }

}
