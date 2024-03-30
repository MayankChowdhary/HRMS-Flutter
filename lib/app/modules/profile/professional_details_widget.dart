import 'package:employee_attendance_flutter/app/data/service/controller/home_controller.dart';
import 'package:employee_attendance_flutter/app/data/service/controller/profile_controller.dart';
import 'package:employee_attendance_flutter/app/modules/profile/profile_edit_arguments.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../core/colors/colors.dart';
import '../../core/utils/dimensions.dart';
import '../../routes/routes.dart';

class ProfessionalDetailsWidget extends StatelessWidget {
  final ProfileController controller;

  const ProfessionalDetailsWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          const SizedBox(height: 10),
          InkWell(
              onTap: (){
                Get.toNamed(Routes.editProfilePage,arguments: ProfileEditArguments(controller.getProfessionalEditItems(), ProfileController.professionalUpdate,{}));
              },
              child:  SizedBox(width: Dimensions.height45, height: Dimensions.height45, child: Icon(Icons.edit_outlined,color: AppColors.kGrayDark,size: Dimensions.iconsSize24,))
          ),
          TextFormField(
            enabled: false,
            controller: controller.designationController,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: Dimensions.font16,
              color: AppColors.kTextFieldColor,
              fontWeight: FontWeight.w600,
            ),
            decoration: const InputDecoration(
                label: Text("Designation", textAlign: TextAlign.end,),
                labelStyle: TextStyle(
                  color: AppColors.kLabelColor,
                ),
                prefixIcon: Icon(
                  Icons.chair_outlined,
                  color: AppColors.kTextFieldColor,
                ),
                disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        width: 1, color: AppColors.kTextDividerColor))),
          ),
          const SizedBox(height: 20),
          TextFormField(
            enabled: false,
            controller: controller.experienceController,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: Dimensions.font16,
              color: AppColors.kTextFieldColor,
              fontWeight: FontWeight.w600,
            ),
            decoration: const InputDecoration(
                label: Text("Total Experience", textAlign: TextAlign.end,),
                labelStyle: TextStyle(
                  color: AppColors.kLabelColor,
                ),
                prefixIcon: Icon(
                  Icons.auto_graph_outlined,
                  color: AppColors.kTextFieldColor,
                ),
                disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        width: 1, color: AppColors.kTextDividerColor))),
          ),
          const SizedBox(height: 20),
          TextFormField(
            enabled: false,
            controller: controller.skillsController,
            textAlign: TextAlign.left,
            maxLines: 2,
            style: TextStyle(
              fontSize: Dimensions.font16,
              color: AppColors.kTextFieldColor,
              fontWeight: FontWeight.w600,
            ),
            decoration: const InputDecoration(
                label: Text("Skills", textAlign: TextAlign.end,),
                labelStyle: TextStyle(
                  color: AppColors.kLabelColor,
                ),
                prefixIcon: Icon(
                  Icons.menu_book_outlined,
                  color: AppColors.kTextFieldColor,
                ),
                disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        width: 1, color: AppColors.kTextDividerColor))),
          ),
          const SizedBox(height: 20),
          TextFormField(
            enabled: false,
            controller: controller.joiningdateController,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: Dimensions.font16,
              color: AppColors.kTextFieldColor,
              fontWeight: FontWeight.w600,
            ),
            decoration: const InputDecoration(
                label: Text("Joining Date", textAlign: TextAlign.end,),
                labelStyle: TextStyle(
                  color: AppColors.kLabelColor,
                ),
                prefixIcon: Icon(
                  Icons.add_box_outlined,
                  color: AppColors.kTextFieldColor,
                ),
                disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        width: 1, color: AppColors.kTextDividerColor))),
          ),
          const SizedBox(height: 20),
          TextFormField(
            enabled: false,
            controller: controller.joiningExperienceController,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: Dimensions.font16,
              color: AppColors.kTextFieldColor,
              fontWeight: FontWeight.w600,
            ),
            decoration: const InputDecoration(
                label: Text("Experience in TYS", textAlign: TextAlign.end,),
                labelStyle: TextStyle(
                  color: AppColors.kLabelColor,
                ),
                prefixIcon: Icon(
                  Icons.auto_graph_outlined,
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
