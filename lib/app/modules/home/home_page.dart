import 'package:employee_attendance_flutter/app/core/colors/colors.dart';
import 'package:employee_attendance_flutter/app/core/utils/app_utils.dart';
import 'package:employee_attendance_flutter/app/data/service/controller/home_controller.dart';
import 'package:employee_attendance_flutter/app/widgets/page_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils/dimensions.dart';
import 'address_text_widget.dart';
import 'bottom_time_summery_widget.dart';
import 'check_in_main_button_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeController>(builder: (controller) {
        return SingleChildScrollView(
            child: Column(children: [
          SizedBox(
            height: Dimensions.height45 * 1.2,
          ),
          const HeaderTitle(text: "HOME"),
          SizedBox(height: Dimensions.height45),
          Text("Welcome  ${controller.userDetails.value?.firstname ?? ""}",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: Dimensions.font22,
                  color: controller.isRemoteUser.value==false? AppColors.kSecondaryColor:AppColors.kRedColor)),
          Text(controller.professionDetails.value?.designation ?? "Unknown profession",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w500, fontSize: Dimensions.font12)),
          SizedBox(height: Dimensions.height45),
          Text(AppUtils.getFormattedDateTime(DateTime.now().toString()),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w600, fontSize: Dimensions.font32)),
          Text(AppUtils.getDateAndDay(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w600, fontSize: Dimensions.font20)),
          SizedBox(height: Dimensions.height45),
          CheckInMainBtnWidget(controller: controller),
          SizedBox(height: Dimensions.height10),
          AddressTextWidget(controller: controller),
          SizedBox(height: Dimensions.height45 * 2.0),
          TimeSummeryWidget(controller: controller),
        ]));
      }),
    );
  }
}
