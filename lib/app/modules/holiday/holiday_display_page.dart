import 'package:employee_attendance_flutter/app/core/colors/colors.dart';
import 'package:employee_attendance_flutter/app/data/model/holiday_model.dart';
import 'package:employee_attendance_flutter/app/data/service/controller/holiday_controller.dart';
import 'package:employee_attendance_flutter/app/data/service/controller/notification_controller.dart';
import 'package:employee_attendance_flutter/app/data/service/controller/regularization_controller.dart';
import 'package:employee_attendance_flutter/app/modules/regularization/regularization_arguments.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils/dimensions.dart';
import '../../widgets/column_list_cell.dart';
import '../../widgets/column_list_row.dart';
import '../../widgets/no_data_widget.dart';

class HolidayPage extends StatelessWidget {
  const HolidayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text("2023 HOLIDAY LIST",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.kMainBlackColor,
                fontWeight: FontWeight.bold,
                fontSize: Dimensions.font18,
              )),
        ),
        elevation: 0,
        backgroundColor: AppColors.kTransparentColor,
      ),
      body: GetBuilder<HolidayController>(init: HolidayController(), builder: (controller) {
        return SizedBox(
          height: Dimensions.screenHeight - (Dimensions.height45 * 3),
          child: controller.holidayList.value?.isNotEmpty==true
              ? ListView.builder(
              shrinkWrap: true,
              itemCount: controller.holidayList.value?.length,
              itemBuilder: (BuildContext context, int index) {
                Holiday? item = controller.holidayList.value?[index];
                return Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: Dimensions.width20,
                      vertical: Dimensions.height10),
                  child: Card(
                    margin: EdgeInsets.zero,
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(Dimensions.radius10),
                        side:
                        const BorderSide(color: AppColors.kGrayColor)),
                    child: Container(
                      padding: const EdgeInsets.only(
                          left: 14, right: 14, bottom: 14, top: 4),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                columnCell("Date",item?.holidaydate??"","Name", item?.holidayname??""),
                              ],
                            ),
                          ),
                          // const SizedBox(width: 8,),
                          // const Icon(Icons.arrow_forward_ios_rounded,color: AppColors.kPrimaryColor,)
                        ],
                      ),
                    ),
                  ),
                );
              })
              : const NoDataWidget(),
        );
      }),
    );
  }
}
