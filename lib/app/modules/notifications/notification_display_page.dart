import 'package:employee_attendance_flutter/app/core/colors/colors.dart';
import 'package:employee_attendance_flutter/app/data/service/controller/notification_controller.dart';
import 'package:employee_attendance_flutter/app/data/service/controller/regularization_controller.dart';
import 'package:employee_attendance_flutter/app/modules/regularization/regularization_arguments.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils/dimensions.dart';
import '../../widgets/column_list_cell.dart';
import '../../widgets/column_list_row.dart';
import '../../widgets/no_data_widget.dart';

class NotificationDisplayPage extends StatelessWidget {
  const NotificationDisplayPage({Key? key}) : super(key: key);

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
          child: Text("NOTIFICATIONS",
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
      body: GetBuilder<NotificationController>(
          init: NotificationController(),
          builder: (controller) {
            return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  NoDataWidget(),
                ]);
          }),
    );
  }
}
