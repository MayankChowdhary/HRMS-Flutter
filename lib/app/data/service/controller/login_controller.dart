import 'dart:convert';

import 'package:employee_attendance_flutter/app/core/utils/app_utils.dart';
import 'package:employee_attendance_flutter/app/data/model/user_data_model.dart';
import 'package:employee_attendance_flutter/app/data/service/binding/home_binding.dart';
import 'package:employee_attendance_flutter/app/data/service/repository/login_repo.dart';
import 'package:employee_attendance_flutter/app/modules/home/bottom_navigator_page.dart';
import 'package:employee_attendance_flutter/app/modules/home/home_page.dart';
import 'package:employee_attendance_flutter/app/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/utils/dialog_helper.dart';
import '../../../core/utils/storage_utils.dart';
import '../../api/error_handling.dart';

class LoginController extends GetxController with StateMixin<dynamic>{
  final textFieldEmail = TextEditingController(text: ''); //rdnet0001690
  final textFieldPassword = TextEditingController(text: '');
  final isPasswordVisible = true.obs;


  void onPasswordToggle(){
    isPasswordVisible(!isPasswordVisible.value);
    update();
  }

  void validate(){
    if(textFieldEmail.text.isEmpty){
      ErrorHandling.showToast('Email is required');
    }else if(textFieldPassword.text.isEmpty){
      ErrorHandling.showToast('Password is required');
    }else{
      submit();
    }
  }

  void submit(){
    try{
      DialogHelper.showLoading();
      LoginRepository().login(textFieldEmail.text.trim(), textFieldPassword.text.trim()).then((value){
        DialogHelper.dismissLoader();

        var js = jsonDecode(value);

        final model = UserDataModel.fromJson(js);

        StorageUtils.instance.setIsLoggedIn(true);
        StorageUtils.instance.setToken(model.data!.token!);
        StorageUtils.instance.setUsername(textFieldEmail.text);
        // StorageUtils.instance.setSubscriberId(model.userData!.subscriberId.toString());
        // StorageUtils.instance.setUserData(value);
        // StorageUtils.instance.setUsername(textUsername.text.trim());

        Get.offAllNamed(Routes.navigationPage);

      },onError: (e){
        DialogHelper.dismissLoader();
        ErrorHandling.handleErrors(e);
      });
    }catch(e){
      DialogHelper.dismissLoader();
      ErrorHandling.handleErrors(e);
    }
  }
}