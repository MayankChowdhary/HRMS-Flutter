import 'dart:async';
import 'dart:convert';
import 'dart:ffi';

import 'package:employee_attendance_flutter/app/core/utils/app_utils.dart';
import 'package:employee_attendance_flutter/app/data/model/leave_status_model.dart';
import 'package:employee_attendance_flutter/app/data/service/repository/leave_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/dialog_helper.dart';
import '../../../core/utils/show_custom_snackbar.dart';
import '../../api/error_handling.dart';
import '../../model/leave_model.dart';

class LeaveController extends SuperController {
  static LeaveController get to => Get.find();

  final leaveBalance = 0.obs;
  final leaveBalanceProgress = 0.0.obs;
  final leaveTotal = 0.obs;
  final leaveUsed = 0.obs;
  final leaveDetails = Rxn<Leave>();
  DateTime selectedDate = DateTime.now();
  List<DateTime> firstSecondDate = [DateTime.now(),DateTime.now()];
  final startDateController = "dd/mm/yyyy".obs;
  final endDateController = "dd/mm/yyyy".obs;
  TextEditingController reasonController = TextEditingController();
  bool isDateLocked = false;

  final leaveStatusData = Rxn<List<LeaveStatus>>();
  final tableData = Rxn<List<List<String>>>([]);

  Future<void> selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900, 1),
        lastDate: DateTime(2101));
    if (picked != null) {
      selectedDate = picked;
      if (isStartDate) {
        firstSecondDate[0] = picked;
        startDateController.value = getSelectedDate();
      } else {
        firstSecondDate[1] = picked;
        endDateController.value = getSelectedDate();
      }
      update();
    }
  }

  void refreshDate() {
    startDateController.value = getSelectedDate();
    endDateController.value = getSelectedDate();
    update();
  }

  String getSelectedDate() {
    return "${selectedDate.day}-${selectedDate.month}-${selectedDate.year}";
  }

  @override
  void onReady() {
    super.onReady();
    getLeaveStatus();
    getLeaves();
    refreshDate();
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

  void getLeaveStatus() async {
    try {
      DialogHelper.showLoading();
      LeaveRepository().getLeaveInfo().then((value) {
        var js = jsonDecode(value);
        LeaveModel leaveRoot = LeaveModel.fromJson(js);
        Leave? leaveData = leaveRoot.data?[0];
        if (leaveData != null) {
          int total = int.parse(leaveData.totalleave ?? "0");
          int balance = int.parse(leaveData.balleave ?? "0");
          int used = total - balance;
          double progress = ((balance / total) * 100) / 100;
          AppUtils.printMessage("Printing Leave Data:");
          AppUtils.printMessage("Total: $total");
          AppUtils.printMessage("Balance: $balance");
          AppUtils.printMessage("Used: $used");
          AppUtils.printMessage("Progress: $progress");
          leaveTotal(total);
          leaveBalance(balance);
          leaveUsed(used);
          leaveDetails(leaveData);
          leaveBalanceProgress(progress);
        }
        DialogHelper.dismissLoader();
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

  void getLeaves() async {
    try {
      DialogHelper.showLoading();
      LeaveRepository().getLeaves().then((value) {
        var js = jsonDecode(value);
        LeaveStatusRoot leaveRoot = LeaveStatusRoot.fromJson(js);
        List<LeaveStatus?>? leaveStatus = leaveRoot.data;
        leaveStatusData(leaveStatus?.cast<LeaveStatus>());
        getTableData(leaveStatusData.value);
        DialogHelper.dismissLoader();
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

  bool validateLeave(){
    bool isDateValidated = AppUtils.isFirstBeforeOrEqualThanSecond(firstSecondDate[0], firstSecondDate[1]);
    if(reasonController.text.isNotEmpty && isDateValidated){
      return true;
    }
    if(reasonController.text.isEmpty){
      showCustomSnackBar("Reason cannot be blank");
    }
    if(!isDateValidated){
      showCustomSnackBar("End date cannot be smaller than start date");
    }
    return false;
  }

  void applyLeaveRequest() async {
    if(!validateLeave()) {
      return;
    }
    DialogHelper.showLoading();
    AppUtils.printMessage("Applying Leave...");
    try {
      Map<String, String> body = {
        "userid": leaveDetails.value?.userid ?? "",
        "email": leaveDetails.value?.email ?? "",
        "start_date": startDateController.value,
        "end_date": endDateController.value,
        "reason": reasonController.text,
        "appliedOn": AppUtils.getCurrentDate()
      };
      await LeaveRepository().applyLeave(body).then((value) {
        var js = jsonDecode(value);
        if(js["status_code"]==201) {
          closeScreen();
          Get.snackbar("Leave Successful", "Your leave applied successfully.");
        }else{
          showCustomSnackBar("Something went wrong");
        }
      });
    } catch (e) {
      return Future.error(e);
    }
  }

  void closeScreen() {
    DialogHelper.dismissLoader();
    Get.back();
  }

  void getTableData(List<LeaveStatus>?  leaveData){
    List<List<String>> tempData = [];
    if(leaveData!=null) {
      for (var element in leaveData) {
        tempData.add([
          "${element.id}",
          element.email.toString(),
          element.reason.toString(),
          element.startdate.toString(),
          element.enddate.toString(),
          element.appliedOn.toString(),
          element.status.toString()
        ]);
      }
      tableData.value = tempData;
      update();
    }
  }

  @override
  void onHidden() {
    // TODO: implement onHidden
  }
}
