import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils/app_utils.dart';
import '../../core/utils/dimensions.dart';
import '../../data/service/controller/attandence_controller.dart';
import '../../widgets/no_data_widget.dart';
import '../../widgets/page_header_widget.dart';
import 'attendance_chart_widget.dart';
import 'attendance_table_header_widget.dart';
import 'attendance_table_widget.dart';
import 'month_chips_select_widget.dart';

class AttendancePage extends StatelessWidget {
  const AttendancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<AttendanceController>(
            init: AttendanceController(),
            builder: (controller) {
              return SingleChildScrollView(
                  child: Column(children: [
                SizedBox(
                  height: Dimensions.height45 * 1.2,
                ),
                const HeaderTitle(text: "ATTENDANCE"),
                SizedBox(
                  height: Dimensions.height20,
                ),
                controller.attendanceData.isEmpty
                    ? Container()
                    : AttendanceChart(controller: controller),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Select Year"),
                          content: SizedBox(
                            // Need to use container to add size constraint.
                            width: 300,
                            height: 300,
                            child: YearPicker(
                              firstDate: DateTime(DateTime.now().year - 100, 1),
                              lastDate: DateTime(DateTime.now().year + 100, 1),
                              initialDate: DateTime.now(),
                              selectedDate: controller.selectedYear.value??DateTime.now(),
                              onChanged: (DateTime dateTime) {
                                Navigator.pop(context);
                                controller.setYearSelection(dateTime);
                              },
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(AppUtils.getYearFromDate(controller.selectedYear.value??DateTime.now()),
                            style: TextStyle(
                                fontSize: Dimensions.font18,
                                fontWeight: FontWeight.w600)),
                        Icon(Icons.arrow_drop_down_outlined,
                            size: Dimensions.font20 * 2.0)
                      ],
                    ),
                  ),
                ),
                MonthChipWidget(controller: controller),
                SizedBox(
                  height: Dimensions.height20,
                ),
                controller.attendanceData.isEmpty
                    ? const NoDataWidget()
                    : AttendanceTableHeader(controller: controller),
                AttendanceTableWidget(controller: controller),
              ]));
            }));
  }
}
