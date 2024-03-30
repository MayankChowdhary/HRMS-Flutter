import 'package:employee_attendance_flutter/app/core/colors/colors.dart';
import 'package:employee_attendance_flutter/app/data/service/controller/regularization_controller.dart';
import 'package:employee_attendance_flutter/app/data/service/controller/resignation_controller.dart';
import 'package:employee_attendance_flutter/app/modules/regularization/regularization_arguments.dart';
import 'package:employee_attendance_flutter/app/widgets/no_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils/dimensions.dart';
import '../../widgets/column_list_cell.dart';
import '../../widgets/column_list_row.dart';

class ResignationStatusPage extends StatelessWidget {
  const ResignationStatusPage({Key? key}) : super(key: key);

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
          child: Text("RESIGNATION STATUS",
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
      body: GetBuilder<ResignationController>(builder: (controller) {
        return SizedBox(
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
                                    columnCell('Resign Date:', item[2],
                                        'Reason:', item[3]),
                                    columnCell('Applied On:', item[4],
                                        'Status:', item[5]),
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
