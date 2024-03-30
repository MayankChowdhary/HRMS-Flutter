import 'package:employee_attendance_flutter/app/data/service/controller/attandence_controller.dart';
import 'package:flutter/material.dart';

import '../../core/colors/colors.dart';
import '../../core/utils/dimensions.dart';

class AttendanceTableHeader extends StatelessWidget {
  final AttendanceController controller;

  const AttendanceTableHeader({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.kGrayDeem,
      height: Dimensions.height45,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: Dimensions.height45 * 1.6,
            child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Date",
                  style: TextStyle(
                      fontSize: Dimensions.font14,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                )),
          ),
          const VerticalDivider(color: AppColors.kGrayColor),
          SizedBox(
            width: Dimensions.height45 * 1.3,
            child: Align(
                alignment: Alignment.center,
                child: Text("In",
                    style: TextStyle(
                        fontSize: Dimensions.font14,
                        color: Colors.black,
                        fontWeight: FontWeight.w600))),
          ),
          const VerticalDivider(color: AppColors.kGrayColor),
          SizedBox(
            width: Dimensions.height45 * 1.4,
            child: Align(
                alignment: Alignment.center,
                child: Text("Out",
                    style: TextStyle(
                        fontSize: Dimensions.font14,
                        color: Colors.black,
                        fontWeight: FontWeight.w600))),
          ),
          const VerticalDivider(color: AppColors.kGrayColor),
          Expanded(
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text("       Total Hrs",
                    style: TextStyle(
                        fontSize: Dimensions.font14,
                        color: Colors.black,
                        fontWeight: FontWeight.w600))),
          )
        ],
      ),
    );
  }
}
