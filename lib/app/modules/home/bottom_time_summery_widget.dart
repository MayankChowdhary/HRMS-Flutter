import 'package:employee_attendance_flutter/app/data/service/controller/attandence_controller.dart';
import 'package:employee_attendance_flutter/app/data/service/controller/home_controller.dart';
import 'package:flutter/material.dart';

import '../../core/colors/colors.dart';
import '../../core/utils/app_utils.dart';
import '../../core/utils/dimensions.dart';

class TimeSummeryWidget extends StatelessWidget {
  final HomeController controller;

  const TimeSummeryWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 8.0),
            child: Image.asset(
              "assets/images/time_checkin.png",
              width: Dimensions.height30,
              height: Dimensions.height30,
            ),
          ),
          Text(AppUtils.getFormattedTime(controller.checkInTime.value),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w600, fontSize: Dimensions.font18)),
          Text("Check In",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w600, fontSize: Dimensions.font10)),
        ]),
        SizedBox(width: Dimensions.height45 * 1.3),
        Column(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 8.0),
            child: Image.asset(
              "assets/images/time_checkout.png",
              width: Dimensions.height30,
              height: Dimensions.height30,
            ),
          ),
          SizedBox(width: Dimensions.height10),
          Text(AppUtils.getFormattedTime(controller.checkOutTime.value),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w600, fontSize: Dimensions.font18)),
          Text("Check Out",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w600, fontSize: Dimensions.font10)),
        ]),
        SizedBox(width: Dimensions.height45 * 1.3),
        Column(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 8.0),
            child: Image.asset(
              "assets/images/time_total.png",
              width: Dimensions.height30,
              height: Dimensions.height30,
            ),
          ),
          SizedBox(width: Dimensions.height10),
          Text(controller.totalHours.value.substring(0,5),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w600, fontSize: Dimensions.font18)),
          Text("Total hours",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w600, fontSize: Dimensions.font10)),
        ]),
      ],
    );
  }
}
