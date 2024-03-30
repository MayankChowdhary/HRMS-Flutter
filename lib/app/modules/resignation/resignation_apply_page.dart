import 'package:employee_attendance_flutter/app/core/colors/colors.dart';
import 'package:employee_attendance_flutter/app/data/service/controller/regularization_controller.dart';
import 'package:employee_attendance_flutter/app/data/service/controller/resignation_controller.dart';
import 'package:employee_attendance_flutter/app/modules/regularization/regularization_arguments.dart';
import 'package:employee_attendance_flutter/app/modules/resignation/resignation_arguments.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils/dimensions.dart';

class ResignationPage extends StatelessWidget {
  const ResignationPage({Key? key}) : super(key: key);

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
          child: Text("RESIGNATION",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.kMainBlackColor,
                fontWeight: FontWeight.bold,
                fontSize: Dimensions.font20,
              )),
        ),
        elevation: 0,
        backgroundColor: AppColors.kTransparentColor,
      ),
      body: GetBuilder<ResignationController>(builder: (controller) {
        controller.setResignationDate();
        final args = Get.arguments as ResignationArguments;
        controller.emailController.text = args.email;
        controller.userId = args.userId;

        return SingleChildScrollView(
            child: Padding(
          padding:
              const EdgeInsets.only(left: 20.0, right: 20.0, top: 0, bottom: 0),
          child: Column(children: [
            SizedBox(
              height: Dimensions.height45,
            ),
            TextFormField(
              enabled: false,
              controller: controller.emailController,
              maxLines: 1,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: Dimensions.font16,
                color: AppColors.kTextFieldColor,
                fontWeight: FontWeight.w600,
              ),
              decoration: const InputDecoration(
                  label: Text(
                    "Email",
                    textAlign: TextAlign.end,
                  ),
                  labelStyle: TextStyle(
                    color: AppColors.kLabelColor,
                  ),
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: AppColors.kTextFieldColor,
                  ),
                  disabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: AppColors.kTextDividerColor))),
            ),
            SizedBox(
              height: Dimensions.height30,
            ),
            TextFormField(
              enabled: false,
              controller: controller.applyDateController,
              maxLines: 1,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: Dimensions.font16,
                color: AppColors.kTextFieldColor,
                fontWeight: FontWeight.w600,
              ),
              decoration: const InputDecoration(
                  label: Text(
                    "Apply Date",
                    textAlign: TextAlign.end,
                  ),
                  labelStyle: TextStyle(
                    color: AppColors.kLabelColor,
                  ),
                  prefixIcon: Icon(
                    Icons.date_range_outlined,
                    color: AppColors.kTextFieldColor,
                  ),
                  disabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: AppColors.kTextDividerColor))),
            ),
            SizedBox(
              height: Dimensions.height30,
            ),
            TextFormField(
              enabled: false,
              controller: controller.resignDateController,
              maxLines: 1,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: Dimensions.font16,
                color: AppColors.kTextFieldColor,
                fontWeight: FontWeight.w600,
              ),
              decoration: const InputDecoration(
                  label: Text(
                    "Resignation Last Date",
                    textAlign: TextAlign.end,
                  ),
                  labelStyle: TextStyle(
                    color: AppColors.kLabelColor,
                  ),
                  prefixIcon: Icon(
                    Icons.date_range_outlined,
                    color: AppColors.kTextFieldColor,
                  ),
                  disabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: AppColors.kTextDividerColor))),
            ),
            SizedBox(
              height: Dimensions.height30,
            ),
            TextFormField(
              enabled: true,
              controller: controller.reasonController,
              maxLines: 2,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: Dimensions.font16,
                color: AppColors.kTextFieldColor,
                fontWeight: FontWeight.w600,
              ),
              decoration: const InputDecoration(
                  label: Text(
                    "Reason",
                    textAlign: TextAlign.end,
                  ),
                  labelStyle: TextStyle(
                    color: AppColors.kLabelColor,
                  ),
                  prefixIcon: Icon(
                    Icons.help_outline,
                    color: AppColors.kTextFieldColor,
                  ),
                  disabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: AppColors.kTextDividerColor))),
            ),
            SizedBox(
              height: Dimensions.height45 * 4,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.kSecondaryColor,
                minimumSize:
                    Size(Dimensions.height45 * 6.0, Dimensions.height45 * 1.2),
              ),
              onPressed: () {
                controller.applyResignation();
              },
              child: const Text(
                "APPLY",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
          ]),
        ));
      }),
    );
  }
}
