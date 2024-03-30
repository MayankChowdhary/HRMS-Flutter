import 'package:employee_attendance_flutter/app/core/colors/colors.dart';
import 'package:employee_attendance_flutter/app/data/service/controller/leave_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils/dimensions.dart';
import '../../data/service/controller/reimburse_controller.dart';
import '../../widgets/column_list_cell.dart';
import '../../widgets/column_list_row.dart';
import '../../widgets/no_data_widget.dart';

class ReimburseStatusPage extends StatelessWidget {
  const ReimburseStatusPage({Key? key}) : super(key: key);

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
          child: Text("REIMBURSEMENT STATUS",
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
      body: GetBuilder<ReimburseController>(builder: (controller) {
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
                              padding: const EdgeInsets.only(
                                  left: 14, right: 14, bottom: 14, top: 4),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        columnRow("Item:", item[2]),
                                        columnCell(
                                            'Price:', item[3], 'Qty:', item[4]),
                                        columnCell('Amount:', item[5],
                                            'Total Amt:', item[6]),
                                        columnCell('Upi id:', item[7],
                                            'Payment Details', item[8]),
                                        columnCell('Expense Date :', item[1],
                                            'Status:', item[9]),
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
            ),
          ),
        ]);
      }),
    );
  }
}
