import 'dart:async';
import 'dart:convert';
import 'dart:ffi';

import 'package:employee_attendance_flutter/app/core/utils/app_utils.dart';
import 'package:employee_attendance_flutter/app/data/model/leave_status_model.dart';
import 'package:employee_attendance_flutter/app/data/service/repository/leave_repo.dart';
import 'package:employee_attendance_flutter/app/modules/idcard/id_card_arguments.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/dialog_helper.dart';
import '../../../core/utils/show_custom_snackbar.dart';
import '../../api/error_handling.dart';
import '../../model/leave_model.dart';

class IDCARDController extends SuperController {
  static IDCARDController get to => Get.find();



  final idCardDetails = Rxn<IDCARDArguments>();
/*
  final leaveUsed = 0.obs;
  final leaveDetails = Rxn<Leave>();
*/




  @override
  void onReady() {
    super.onReady();

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


  void closeScreen() {
    DialogHelper.dismissLoader();
    Get.back();
  }

  void setIDCard(IDCARDArguments args){
    idCardDetails(args);
    update();
  }

  @override
  void onHidden() {
    // TODO: implement onHidden
  }

}
