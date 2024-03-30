import 'package:employee_attendance_flutter/app/modules/attendance/pie_chart_widget.dart';
import 'package:employee_attendance_flutter/app/widgets/no_data_widget.dart';
import 'package:flutter/material.dart';

import '../../core/colors/colors.dart';
import '../../core/utils/dimensions.dart';
import '../../data/service/controller/attandence_controller.dart';

class AttendanceChart extends StatelessWidget {
  final AttendanceController controller;

  const AttendanceChart({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: Dimensions.height20),
          PieChartWidget(controller: controller),
          SizedBox(
              height: Dimensions.height45 * 4.0,
              child: const VerticalDivider(color: AppColors.kGrayDark)),
        ],
      ),
      Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding:  EdgeInsets.only(right: 0, top: Dimensions.height10),
          child: SizedBox(
            width: Dimensions.height45 * 3.4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "TOTAL",
                  style: TextStyle(
                      fontSize: Dimensions.font14,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "Days - ${controller.workingDays.toString()}/${controller.totalDays.toString()}",
                  style: TextStyle(
                      fontSize: Dimensions.font14,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "Hours - ${controller.totalHours.toString()}/${controller.maxHours.toString()}",
                  style: TextStyle(
                      fontSize: Dimensions.font14,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: Dimensions.height10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            height: Dimensions.font12,
                            width: Dimensions.font12,
                            decoration: BoxDecoration(
                                color: AppColors.kChartPresent,
                                borderRadius: BorderRadius.circular(100)
                                //more than 50% of width makes circle
                                )),
                        SizedBox(
                          width: Dimensions.height5,
                        ),
                        Text(
                          "Present - ${controller.presentCount.value}/${controller.workingDays.value}",
                          style: TextStyle(
                              fontSize: Dimensions.font14,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.height5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            height: Dimensions.font12,
                            width: Dimensions.font12,
                            decoration: BoxDecoration(
                                color: AppColors.kChartAbsent,
                                borderRadius: BorderRadius.circular(100)
                                //more than 50% of width makes circle
                                )),
                        SizedBox(
                          width: Dimensions.height5,
                        ),
                        Text(
                          "Absent - ${controller.absentCount.value}/${controller.workingDays.value}",
                          style: TextStyle(
                              fontSize: Dimensions.font14,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.height5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            height: Dimensions.font12,
                            width: Dimensions.font12,
                            decoration: BoxDecoration(
                                color: AppColors.kChartLate,
                                borderRadius: BorderRadius.circular(100)
                                //more than 50% of width makes circle
                                )),
                        SizedBox(
                          width: Dimensions.height5,
                        ),
                        Text(
                          "Late - ${controller.lateCount.value}/${controller.workingDays.value}",
                          style: TextStyle(
                              fontSize: Dimensions.font14,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.height5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            height: Dimensions.font12,
                            width: Dimensions.font12,
                            decoration: BoxDecoration(
                                color: AppColors.kChartHalfDay,
                                borderRadius: BorderRadius.circular(100)
                              //more than 50% of width makes circle
                            )),
                        SizedBox(
                          width: Dimensions.height5,
                        ),
                        Text(
                          "Half Day - ${controller.halfDayCount.value}/${controller.workingDays.value}",
                          style: TextStyle(
                              fontSize: Dimensions.font14,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.height5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            height: Dimensions.font12,
                            width: Dimensions.font12,
                            decoration: BoxDecoration(
                                color: AppColors.kChartLeave,
                                borderRadius: BorderRadius.circular(100)
                              //more than 50% of width makes circle
                            )),
                        SizedBox(
                          width: Dimensions.height5,
                        ),
                        Text(
                          "Leave - ${controller.leaveCount.value}/${controller.workingDays.value}",
                          style: TextStyle(
                              fontSize: Dimensions.font14,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      )
    ]);
  }
}
