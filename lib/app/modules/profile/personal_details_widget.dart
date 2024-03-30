import 'package:employee_attendance_flutter/app/data/service/controller/home_controller.dart';
import 'package:employee_attendance_flutter/app/data/service/controller/profile_controller.dart';
import 'package:employee_attendance_flutter/app/modules/profile/profile_edit_arguments.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../core/colors/colors.dart';
import '../../core/utils/dimensions.dart';
import '../../routes/routes.dart';

class PersonalDetailsWidget extends StatelessWidget {
  final ProfileController controller;

  const PersonalDetailsWidget({
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
                Get.toNamed(Routes.editProfilePage,arguments: ProfileEditArguments(controller.getPersonalEditItems(), ProfileController.personalUpdate,controller.getExtrasEditItems()));

              },
              child:  SizedBox(width: Dimensions.height45, height: Dimensions.height45, child: Icon(Icons.edit_outlined,color: AppColors.kGrayDark,size: Dimensions.iconsSize24,))
          ),

          TextFormField(
            enabled: false,
            controller: controller.addressController,
            maxLines: 4,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: Dimensions.font16,
              color: AppColors.kTextFieldColor,
              fontWeight: FontWeight.w600,
            ),
            decoration: const InputDecoration(
                label: Text("Address", textAlign: TextAlign.end,),
                labelStyle: TextStyle(
                  color: AppColors.kLabelColor,
                ),
                prefixIcon: Icon(
                  Icons.location_on_outlined,
                  color: AppColors.kTextFieldColor,
                ),
                disabledBorder: UnderlineInputBorder(
                    borderSide:
                    BorderSide(width: 1, color: AppColors.kTextDividerColor))),
          ),
          const SizedBox(height: 20),
          TextFormField(
            enabled: false,
            controller: controller.addressTypeController,
            maxLines: 1,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: Dimensions.font16,
              color: AppColors.kTextFieldColor,
              fontWeight: FontWeight.w600,
            ),
            decoration: const InputDecoration(
                label: Text("Address Type", textAlign: TextAlign.end,),
                labelStyle: TextStyle(
                  color: AppColors.kLabelColor,
                ),
                prefixIcon: Icon(
                  Icons.not_listed_location_outlined,
                  color: AppColors.kTextFieldColor,
                ),
                disabledBorder: UnderlineInputBorder(
                    borderSide:
                    BorderSide(width: 1, color: AppColors.kTextDividerColor))),
          ),
          const SizedBox(height: 20),
          TextFormField(
            enabled: false,
            controller: controller.dobController,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: Dimensions.font16,
              color: AppColors.kTextFieldColor,
              fontWeight: FontWeight.w600,
            ),
            decoration: const InputDecoration(
                label: Text("Date of birth", textAlign: TextAlign.end,),
                labelStyle: TextStyle(
                  color: AppColors.kLabelColor,
                ),
                prefixIcon: Icon(
                  Icons.cake_outlined,
                  color: AppColors.kTextFieldColor,
                ),
                disabledBorder: UnderlineInputBorder(
                    borderSide:
                    BorderSide(width: 1, color: AppColors.kTextDividerColor))),
          ),
          const SizedBox(height: 20),
          TextFormField(
            enabled: false,
            controller: controller.bioController,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: Dimensions.font16,
              color: AppColors.kTextFieldColor,
              fontWeight: FontWeight.w600,
            ),
            decoration: const InputDecoration(
                label: Text("Bio", textAlign: TextAlign.end,),
                labelStyle: TextStyle(
                  color: AppColors.kLabelColor,
                ),
                prefixIcon: Icon(
                  Icons.featured_play_list_outlined,
                  color: AppColors.kTextFieldColor,
                ),
                disabledBorder: UnderlineInputBorder(
                    borderSide:
                    BorderSide(width: 1, color: AppColors.kTextDividerColor))),
          ),
          const SizedBox(height: 20),
          TextFormField(
            enabled: false,
            controller: controller.genderController,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: Dimensions.font16,
              color: AppColors.kTextFieldColor,
              fontWeight: FontWeight.w600,
            ),
            decoration: const InputDecoration( label: Text("Gender", textAlign: TextAlign.end,),
                labelStyle: TextStyle(
                  color: AppColors.kLabelColor,
                ),

                prefixIcon: Icon(
                  Icons.male,
                  color: AppColors.kTextFieldColor,
                ),
                disabledBorder: UnderlineInputBorder(
                    borderSide:
                    BorderSide(width: 1, color: AppColors.kTextDividerColor))),
          ),
          const SizedBox(height: 20),
          TextFormField(
            enabled: false,
            controller: controller.bloodController,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: Dimensions.font16,
              color: AppColors.kTextFieldColor,
              fontWeight: FontWeight.w600,
            ),
            decoration: const InputDecoration( label: Text("Blood Group", textAlign: TextAlign.end,),
                labelStyle: TextStyle(
                  color: AppColors.kLabelColor,
                ),

                prefixIcon: Icon(
                  Icons.bloodtype_outlined,
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
