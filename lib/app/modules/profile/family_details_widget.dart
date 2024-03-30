import 'package:employee_attendance_flutter/app/data/service/controller/home_controller.dart';
import 'package:employee_attendance_flutter/app/data/service/controller/profile_controller.dart';
import 'package:employee_attendance_flutter/app/modules/profile/profile_edit_arguments.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../core/colors/colors.dart';
import '../../core/utils/dimensions.dart';
import '../../routes/routes.dart';

class FamilyDetailsWidget extends StatelessWidget {
  final ProfileController controller;

  const FamilyDetailsWidget({
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
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          const SizedBox(height: 10),
          InkWell(
              onTap: (){
                Get.toNamed(Routes.editProfilePage,arguments: ProfileEditArguments(controller.getFamilyEditItems(), ProfileController.familyUpdate,{}));
              },
              child:  SizedBox(width: Dimensions.height45, height: Dimensions.height45, child: Icon(Icons.edit_outlined,color: AppColors.kGrayDark,size: Dimensions.iconsSize24,))
          ),
          TextFormField(
            enabled: false,
            controller: controller.fatherNameController,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: Dimensions.font16,
              color: AppColors.kTextFieldColor,
              fontWeight: FontWeight.w600,
            ),
            decoration: const InputDecoration(
                label: Text("Father's Name", textAlign: TextAlign.end,),
                labelStyle: TextStyle(
                  color: AppColors.kLabelColor,
                ),
                prefixIcon: Icon(
                  Icons.elderly_outlined,
                  color: AppColors.kTextFieldColor,
                ),
                disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        width: 1, color: AppColors.kTextDividerColor))),
          ),
          const SizedBox(height: 20),
          TextFormField(
            enabled: false,
            controller: controller.motherNameController,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: Dimensions.font16,
              color: AppColors.kTextFieldColor,
              fontWeight: FontWeight.w600,
            ),
            decoration: const InputDecoration(
                label: Text("Mother's Name", textAlign: TextAlign.end,),
                labelStyle: TextStyle(
                  color: AppColors.kLabelColor,
                ),
                prefixIcon: Icon(
                  Icons.elderly_woman_outlined,
                  color: AppColors.kTextFieldColor,
                ),
                disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        width: 1, color: AppColors.kTextDividerColor))),
          ),
          const SizedBox(height: 20),
          TextFormField(
            enabled: false,
            controller: controller.personalEmailController,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: Dimensions.font16,
              color: AppColors.kTextFieldColor,
              fontWeight: FontWeight.w600,
            ),
            decoration: const InputDecoration(
                label: Text("Personal Email", textAlign: TextAlign.end,),
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
          const SizedBox(height: 20),
          TextFormField(
            enabled: false,
            controller: controller.alternateContactController,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: Dimensions.font16,
              color: AppColors.kTextFieldColor,
              fontWeight: FontWeight.w600,
            ),
            decoration: const InputDecoration(
                label: Text("Alternate Contact", textAlign: TextAlign.end,),
                labelStyle: TextStyle(
                  color: AppColors.kLabelColor,
                ),
                prefixIcon: Icon(
                  Icons.phone_android_outlined,
                  color: AppColors.kTextFieldColor,
                ),
                disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        width: 1, color: AppColors.kTextDividerColor))),
          ),
          const SizedBox(height: 20),
          TextFormField(
            enabled: false,
            controller: controller.familyaddressController,
            textAlign: TextAlign.start,
            maxLines: 2,
            style: TextStyle(
              fontSize: Dimensions.font16,
              color: AppColors.kTextFieldColor,
              fontWeight: FontWeight.w600,
            ),
            decoration: const InputDecoration(
                label: Text("Family's Address", textAlign: TextAlign.end,),
                labelStyle: TextStyle(
                  color: AppColors.kLabelColor,
                ),
                prefixIcon: Icon(
                  Icons.home_outlined,
                  color: AppColors.kTextFieldColor,
                ),
                disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        width: 1, color: AppColors.kTextDividerColor))),
          ),
        ]),
      ),
    );
  }
}
