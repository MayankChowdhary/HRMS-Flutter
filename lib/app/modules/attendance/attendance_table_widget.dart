import 'package:employee_attendance_flutter/app/data/service/controller/attandence_controller.dart';
import 'package:employee_attendance_flutter/app/modules/applyleave/leave_arguments.dart';
import 'package:employee_attendance_flutter/app/modules/regularization/regularization_arguments.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/colors/colors.dart';
import '../../core/utils/app_utils.dart';
import '../../core/utils/dimensions.dart';
import '../../routes/routes.dart';

class AttendanceTableWidget extends StatelessWidget {
  final AttendanceController controller;

  const AttendanceTableWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      children: controller.attendanceData.map((data) {
        return Flex(direction: Axis.horizontal, children: [
          Expanded(
            child: Container(
                height: Dimensions.height45 * 1.3,
                width: Dimensions.screenWidth,
                decoration: const BoxDecoration(
                  //                    <-- BoxDecoration
                  border: Border(
                      bottom: BorderSide(color: AppColors.kLightGrayPlus)),
                ),
                margin:
                    const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 8.0),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: Dimensions.height45 * 1.6,
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: Dimensions.iconsSize50,
                              height: Dimensions.iconsSize50,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(2.0),
                              decoration: BoxDecoration(
                                  color: data.attstatus == "Present"
                                      ? AppColors.kChartPresent.withOpacity(0.2)
                                      : data.attstatus == "Late"
                                          ? AppColors.kSecondaryColor
                                              .withOpacity(0.2)
                                          : data.attstatus == "Absent"
                                              ? AppColors.kRedColor
                                                  .withOpacity(0.2)
                                              : AppColors.kGrayDeem
                                                  .withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(6)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    AppUtils.getDateNumber(
                                        data.attdate.toString()),
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontSize: Dimensions.font14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  Text(
                                    AppUtils.getDateDay(
                                        data.attdate.toString()),
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontSize: Dimensions.font14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            )),
                      ),
                      SizedBox(
                        width: Dimensions.height45 * 1.3,
                        child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              AppUtils.getFormattedTime(data.intime.toString()),
                              style: TextStyle(
                                  fontSize: Dimensions.font14,
                                  color: AppColors.kTextColor,
                                  fontWeight: FontWeight.w600),
                            )),
                      ),
                      const SizedBox(width: 20),
                      SizedBox(
                        width: Dimensions.height45 * 1.2,
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              AppUtils.getFormattedTime(
                                  data.outtime.toString()),
                              style: TextStyle(
                                  fontSize: Dimensions.font14,
                                  color: AppColors.kTextColor,
                                  fontWeight: FontWeight.w600),
                            )),
                      ),
                      const SizedBox(width: 20),
                      SizedBox(
                        width: Dimensions.height45 * 2.6,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            data.totalhours.toString().trim(),
                            style: TextStyle(
                                fontSize: Dimensions.font14,
                                color: AppColors.kTextColor,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: Dimensions.height30,
                        child: PopupMenuButton(
                            icon: const Icon(Icons.more_vert,
                                color: AppColors.kTextColor),
                            onSelected: (value) {
                              if (value == 1) {
                                Get.toNamed(Routes.regularizationPage,
                                    arguments: RegularizationArguments(
                                        data.userid ?? "",
                                        data.id.toString() ?? "",
                                        data.email ?? "",
                                        data.attdate ?? ""));
                              }else if(value==2){
                                Get.toNamed(Routes.leavePage,
                                    arguments: LeaveArguments(
                                       AppUtils.parseDateTimeFromString(data.attdate ?? "")));
                              }
                            },
                            itemBuilder: (context) => [
                                  PopupMenuItem(
                                      value: 1,
                                      child: Row(
                                        children: const <Widget>[
                                          Padding(
                                            padding: EdgeInsets.all(5),
                                            child: Icon(Icons.timeline),
                                          ),
                                          Text("Regularization")
                                        ],
                                      )),
                                  PopupMenuItem(
                                      value: 2,
                                      child: Row(
                                        children: const <Widget>[
                                          Padding(
                                            padding: EdgeInsets.all(5),
                                            child: Icon(Icons.time_to_leave),
                                          ),
                                          Text("Apply Leave")
                                        ],
                                      )),
                                ]),
                      )
                    ])),
          ),
        ]);
      }).toList(),
    );
  }
}
