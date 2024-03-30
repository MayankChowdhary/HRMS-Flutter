import 'package:employee_attendance_flutter/app/core/colors/colors.dart';
import 'package:employee_attendance_flutter/app/core/utils/dimensions.dart';
import 'package:employee_attendance_flutter/app/core/utils/tone_play.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class CheckInDialog {
  static void showDialog(bool isCheckOut, bool isLate) async {
    String message = isLate
        ? "Oops,\nYou're late today."
        : "Congratulations!\nYou're on time. Keep it up";
    if (isCheckOut) {
      message = "You have been successfully checked out.";
    }
    Get.dialog(
      WillPopScope(
        child: Padding(
          padding: EdgeInsets.only(
              left: Dimensions.height45,
              right: Dimensions.height45,
              top: Dimensions.height45 * 5.5,
              bottom: Dimensions.height45 * 5.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(Dimensions.height20),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: Dimensions.height15,
                  left: Dimensions.height5,
                  right: Dimensions.height5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  isCheckOut?
                  Lottie.asset(
                    "assets/anim/check_out_lotte.json",
                    width: Dimensions.height45 * 5.0,
                    height: Dimensions.height45 * 5.0,
                    fit: BoxFit.fill,
                  ):
                  isLate
                      ? Lottie.asset(
                          "assets/anim/check_in_late_lotte.json",
                          width: Dimensions.height45 * 5.0,
                          height: Dimensions.height45 * 5.0,
                          fit: BoxFit.fill,
                        )
                      : Lottie.asset(
                          "assets/anim/check_in_lotte.json",
                          width: Dimensions.height45 * 5.0,
                          height: Dimensions.height45 * 5.0,
                          fit: BoxFit.fill,
                        ),
                  SizedBox(height: Dimensions.height15),
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: Dimensions.font20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.kBlackColor),
                  )
                ],
              ),
            ),
          ),
        ),
        onWillPop: () async {
          return false;
        },
      ),
      barrierDismissible: false,
    );
    if(isCheckOut){
      TonePlay(TonePlay.checkOutPlay);
    }else {
      if(isLate){
        TonePlay(TonePlay.checkInLatePlay);
      }else {
        TonePlay(TonePlay.checkInPlay);
      }
    }
    Future.delayed(const Duration(seconds: 3), () {
      dismissDialog();
    });
  }

  static void dismissDialog() async {
    bool? isOpen = Get.isDialogOpen;
    if (isOpen!) {
      Get.back();
    }
  }
}
