import 'dart:convert';

import 'package:employee_attendance_flutter/app/core/utils/app_utils.dart';
import 'package:employee_attendance_flutter/app/data/model/regularization_model.dart';
import 'package:employee_attendance_flutter/app/data/service/repository/regularization_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/utils/dialog_helper.dart';
import '../../api/error_handling.dart';

class RegularizationController extends SuperController {
  static RegularizationController get to => Get.find();

  var emailController = TextEditingController(text: "");
  var dateController = TextEditingController(text: "");
  var reasonController = TextEditingController(text: "");
  final regularizationX = Rxn<List<Regularization>>();
  final tableData = Rxn<List<List<String>>>([]);

  var userId = "";
  var attId = "";

  @override
  void onReady() {
    super.onReady();
    getRegularization();
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

  void applyRegularization() {
    DialogHelper.showLoading();
    try {
      Map<String, String> body = {
        "userid": userId,
        "att_id": attId,
        "email": emailController.text,
        "att_date": dateController.text,
        "reason": reasonController.text
      };
      RegularizationRepository().applyRegularization(body).then((value) {
        DialogHelper.dismissLoader();
        Get.back();
        Get.snackbar("Regularization", "Applied successfully");
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

  void getRegularization() async {
    try {
      DialogHelper.showLoading();
      RegularizationRepository().getRegularization().then((value) {
        var js = jsonDecode(value);
        RegularizationRoot regularizationRoot = RegularizationRoot.fromJson(js);
        List<Regularization?>? regularization = regularizationRoot.data;
        regularizationX.value = regularization?.cast<Regularization>();
        getTableData(regularizationX.value);
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

  void getTableData(List<Regularization>?  regularization){
    List<List<String>> tempData = [];
    if(regularization!=null) {
      for (var element in regularization) {
        AppUtils.printMessage("Adding items: ${element.attdate}");
        tempData.add([
          element.id.toString(),
          element.email.toString().toString(),
          element.attdate.toString(),
          element.reason.toString(),
          element.status.toString()
        ]);
      }
      tableData.value = tempData;
      update();
    }
  }

}
