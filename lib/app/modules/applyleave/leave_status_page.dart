import 'package:employee_attendance_flutter/app/core/colors/colors.dart';
import 'package:employee_attendance_flutter/app/data/service/controller/leave_controller.dart';
import 'package:employee_attendance_flutter/app/data/service/controller/regularization_controller.dart';
import 'package:employee_attendance_flutter/app/modules/regularization/regularization_arguments.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils/dimensions.dart';
import '../../widgets/column_list_cell.dart';
import '../../widgets/column_list_row.dart';
import '../../widgets/no_data_widget.dart';

class LeaveStatusPage extends StatelessWidget {
  const LeaveStatusPage({Key? key}) : super(key: key);

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
          child: Text("LEAVE STATUS",
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
      body: GetBuilder<LeaveController>(builder: (controller) {
        return Column(children: [
          SizedBox(
            height: Dimensions.screenHeight - (Dimensions.height45 * 3),
            child: SizedBox(
              height: Dimensions.screenHeight - (Dimensions.height45 * 3),
              child: controller.tableData.value!.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.tableData.value?.length,
                      itemBuilder: (BuildContext context, int index) {
                        List<String> item = controller.tableData.value![index];
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
                                side: const BorderSide(
                                    color: AppColors.kGrayColor)),
                            child: Container(
                              padding: const EdgeInsets.all(14),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        columnRow('Reason:', item[2]),
                                        columnCell('Applied On:', item[5],
                                            'Status:', item[6]),
                                        columnCell('Start Date:', item[3],
                                            'End Date:', item[4]),
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
                        /* Card(
                      margin: EdgeInsets.all(Dimensions.height10),
                      elevation: 6,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Applied On:",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: Dimensions.font16),
                                  ),
                                  SizedBox(
                                    width: Dimensions.height10,
                                  ),
                                  Text(item[5],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: Dimensions.font16)),
                                ],
                              ),
                              SizedBox(
                                height: Dimensions.height10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Reason:",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: Dimensions.font16),
                                  ),
                                  SizedBox(
                                    width: Dimensions.height10,
                                  ),
                                  Flexible(
                                    child: Text(item[2],
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: Dimensions.font16)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: Dimensions.height10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Start Date:",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: Dimensions.font16),
                                  ),
                                  SizedBox(
                                    width: Dimensions.height10,
                                  ),
                                  Text(item[3],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: Dimensions.font16)),
                                ],
                              ),
                              SizedBox(
                                height: Dimensions.height10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "End Date:",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: Dimensions.font16),
                                  ),
                                  SizedBox(
                                    width: Dimensions.height10,
                                  ),
                                  Text(item[4],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: Dimensions.font16)),
                                ],
                              ),
                              SizedBox(
                                height: Dimensions.height10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Status:",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: Dimensions.font16),
                                  ),
                                  SizedBox(
                                    width: Dimensions.height10,
                                  ),
                                  Text(item[6],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: Dimensions.font16)),
                                ],
                              ),
                              SizedBox(
                                height: Dimensions.height10,
                              ),
                            ]),
                      ),
                    );*/
                      })
                  : const NoDataWidget(),
            ),
          ),
        ]);
      }),
    );
  }
}
