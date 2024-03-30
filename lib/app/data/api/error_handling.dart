import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../core/colors/colors.dart';
import '../../core/utils/storage_utils.dart';
import '../../modules/splash/splash_page.dart';
import 'api_message.dart';
import 'app_exception.dart';

class ErrorHandling {
  static bool showError = true;

  static bool isAlreadyOnLogout = false;
  static const int LOCATION_SETTING_ACTION = 1;

  static void handleErrors(error) {
    if (error is UnAuthorisedException) {
      if (!isAlreadyOnLogout) {
        showErrorPopUp("ERROR", 'Unauthorized','Logout').then((value) => logout());
      }
    } else if (error is SocketException) {
      showErrorPopUp("ERROR", "Looks like not connected to internet", 'OK');
    } else if (error is UnProcessableEntity) {
      try {
        var jsonMap = jsonDecode(error.toString());
        var msg = ApiMessage.fromJson(jsonMap);
        showErrorPopUp("ERROR", msg.message, 'OK');
      } catch (e) {
        showErrorPopUp("ERROR",'Something went wrong','OK');
      }
    } else {
      try {
        var jsonMap = jsonDecode(error.toString());
        var msg = ApiMessage.fromJson(jsonMap);
        showErrorPopUp("ERROR", msg.message, 'OK');
      } catch (e) {
        showErrorPopUp("ERROR",'Something went wrong','OK');
      }
    }
  }

  static Future<void> showErrorPopUp(String title, String message, String buttonText)async {
    bool isOpen = Get.isDialogOpen!;
    if (!isOpen) {
      return await Get.defaultDialog(
        title: title,
        middleText: message,
        titleStyle: const TextStyle(
          fontWeight: FontWeight.w700,
          color: AppColors.kMainBlackColor,
          fontSize: 16,
        ),
        middleTextStyle:const TextStyle(
          fontWeight: FontWeight.w600,
          color:AppColors.kMainBlackColor,
          fontSize: 16,
        ),
        textConfirm: buttonText,
        confirmTextColor: AppColors.kMainBlackColor,
        buttonColor: AppColors.kPrimaryColor,
        barrierDismissible: false,
        onConfirm: () {
          Get.back(result: 'success');
        },
        onWillPop: () async {
          return false;
        },
      );
    }
  }


  static Future<void> showErrorWithAction(String title, String message, String buttonText, int action)async {
    bool isOpen = Get.isDialogOpen!;
    if (!isOpen) {
      return await Get.defaultDialog(
        title: title,
        middleText: message,
        titleStyle: const TextStyle(
          fontWeight: FontWeight.w700,
          color: AppColors.kMainBlackColor,
          fontSize: 16,
        ),
        middleTextStyle:const TextStyle(
          fontWeight: FontWeight.w600,
          color:AppColors.kMainBlackColor,
          fontSize: 16,
        ),
        textConfirm: buttonText,
        confirmTextColor: AppColors.kMainBlackColor,
        buttonColor: AppColors.kPrimaryColor,
        barrierDismissible: false,
        onConfirm: () {
          if(action==LOCATION_SETTING_ACTION){
           openAppSettings();
           Future.delayed(const Duration(milliseconds: 200), () {
              exit(0);
           });
          }
        },
        onWillPop: () async {
          return false;
        },
      );
    }
  }

  static Future<dynamic> showCancelableErrorPopUp(String title, String message,
      String confirmButtonText, String cancelButtonText) async{
    //if (showError) {
    bool isOpen = Get.isDialogOpen!;
    if (!isOpen) {
      return await Get.defaultDialog(
        title: title,
        middleText: message,
        titleStyle: const TextStyle(
          fontWeight: FontWeight.w700,
          color: AppColors.kMainBlackColor,
          fontSize: 16,
        ),
        middleTextStyle:const TextStyle(
          fontWeight: FontWeight.w600,
          color: AppColors.kMainBlackColor,
          fontSize: 16,
        ),
        textConfirm: confirmButtonText,
        confirmTextColor: AppColors.kMainBlackColor,
        buttonColor: AppColors.kPrimaryColor,
        barrierDismissible: false,
        onConfirm: () {
          //showError = true;
          Get.back(result: 'ok');
        },
        onWillPop: () async {
          return false;
        },
        textCancel: cancelButtonText,
        cancelTextColor:AppColors.kMainBlackColor,
        onCancel: () {
          //showError = true;
          Get.back(result: 'cancel');
        },
      );
    }
  }

  static void logout() {
    isAlreadyOnLogout = true;
    StorageUtils.instance.clearAll();
    Get.offAll(
          () => const SplashPage(),
      transition: Transition.rightToLeft,
    );
  }

  static void showToast(String message){
    Get.closeAllSnackbars();
    Get.snackbar('Message', message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.kMainBlackColor,
      colorText: AppColors.kWhiteColor,
    );
  }

}
