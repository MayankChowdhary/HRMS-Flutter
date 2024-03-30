import 'package:employee_attendance_flutter/app/data/service/controller/home_controller.dart';
import 'package:employee_attendance_flutter/app/data/service/controller/profile_controller.dart';
import 'package:flutter/material.dart';

import '../../core/colors/colors.dart';
import '../../core/utils/dimensions.dart';

class UserDetailsWidget extends StatelessWidget {
  final ProfileController controller;

  const UserDetailsWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(height: 10),
          TextFormField(
            enabled: false,
            controller: controller.emailController,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: Dimensions.font16,
              color: AppColors.kTextFieldColor,
              fontWeight: FontWeight.w600,
            ),
            decoration: const InputDecoration(
              label: Text("Email", textAlign: TextAlign.end,),
              labelStyle: TextStyle(
              color: AppColors.kLabelColor,
              ),
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: AppColors.kTextFieldColor,
                ),
                disabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(width: 1, color: AppColors.kTextDividerColor))),
          ),
          const SizedBox(height: 20),
          TextFormField(
            enabled: false,
            controller: controller.phoneController,
            textAlign: TextAlign.left,
            style: TextStyle(

              fontSize: Dimensions.font16,
              color: AppColors.kTextFieldColor,
              fontWeight: FontWeight.w600,
            ),
            decoration: const InputDecoration(
                label: Text("Phone", textAlign: TextAlign.end,),
                labelStyle: TextStyle(
                  color: AppColors.kLabelColor,
                ),
                prefixIcon: Icon(
                  Icons.phone_outlined,
                  color: AppColors.kTextFieldColor,
                ),
                disabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(width: 1, color: AppColors.kTextDividerColor))),
          ),
        ]),
      ),
    );
  }
}
