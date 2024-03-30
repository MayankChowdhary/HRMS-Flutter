import 'package:employee_attendance_flutter/app/core/utils/constants.dart';
import 'package:employee_attendance_flutter/app/data/service/controller/attandence_controller.dart';
import 'package:employee_attendance_flutter/app/data/service/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vibration/vibration.dart';

import '../../core/colors/colors.dart';
import '../../core/utils/app_utils.dart';
import '../../core/utils/dimensions.dart';
import '../../widgets/custom_dialog.dart';

class CheckInMainBtnWidget extends StatelessWidget {
  final HomeController controller;

  const CheckInMainBtnWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
          height: Dimensions.height45 * 5.2,
          width: Dimensions.width45 * 5.2,
          child: InkResponse(
              splashFactory: InkRipple.splashFactory,
              radius: 90,
              splashColor: Colors.black12,
              highlightColor: Colors.transparent,
              onTap: () {
                if ( controller.isRemoteUser.value || controller.isUserInRadius) {
                  controller.isCheckedIn.value == false
                      ? controller.createAttendance()
                      : showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CustomDialog(
                                message: "Are you sure you want to checkout?",
                                onOk: controller.createAttendance);
                          });
                } else {
                  Get.snackbar("Wrong Location",
                      "Check-in not allowed! \nDistance can only within ${AppConstants.kCheckInDistance} metres.");
                  Vibration.vibrate(duration: 500);
                }
              },
              child: controller.isCheckedIn.value == false
                  ? Ink.image(
                      fit: BoxFit.cover, // Fixes border issues
                      image: const AssetImage('assets/images/checkin.png'),
                    )
                  : Ink.image(
                      fit: BoxFit.cover, // Fixes border issues
                      image: const AssetImage('assets/images/checkout.png'),
                    ))),
      Positioned(
        left: Dimensions.width30 * 2.2,
        top: Dimensions.height45 * 3.6,
        child: controller.isCheckedIn.value == false
            ? Text("Check In",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Dimensions.font20,
                    color: Colors.white))
            : Text("Check Out",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Dimensions.font20,
                    color: Colors.white)),
      )
    ]);
  }
}
