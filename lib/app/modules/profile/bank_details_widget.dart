import 'package:employee_attendance_flutter/app/data/service/controller/home_controller.dart';
import 'package:employee_attendance_flutter/app/data/service/controller/profile_controller.dart';
import 'package:employee_attendance_flutter/app/modules/profile/profile_edit_arguments.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../core/colors/colors.dart';
import '../../core/utils/dimensions.dart';
import '../../routes/routes.dart';

class BankDetailsWidget extends StatelessWidget {
  final ProfileController controller;

  const BankDetailsWidget({
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
                Get.toNamed(Routes.editProfilePage,arguments: ProfileEditArguments(controller.getBankBlockEditItems(), ProfileController.bankUpdate,{}));
              },
              child:  SizedBox(width: Dimensions.height45, height: Dimensions.height45, child: Icon(Icons.edit_outlined,color: AppColors.kGrayDark,size: Dimensions.iconsSize24,))
          ),
          TextFormField(
            enabled: false,
            controller: controller.bankNameController,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: Dimensions.font16,
              color: AppColors.kTextFieldColor,
              fontWeight: FontWeight.w600,
            ),
            decoration: const InputDecoration(
                label: Text("Bank Name", textAlign: TextAlign.end,),
                labelStyle: TextStyle(
                  color: AppColors.kLabelColor,
                ),
                prefixIcon: Icon(
                  Icons.account_balance_outlined,
                  color: AppColors.kTextFieldColor,
                ),
                disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        width: 1, color: AppColors.kTextDividerColor))),
          ),
          const SizedBox(height: 20),
          TextFormField(
            enabled: false,
            controller: controller.accountNoController,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: Dimensions.font16,
              color: AppColors.kTextFieldColor,
              fontWeight: FontWeight.w600,
            ),
            decoration: const InputDecoration(
                label: Text("Account No.", textAlign: TextAlign.end,),
                labelStyle: TextStyle(
                  color: AppColors.kLabelColor,
                ),
                prefixIcon: Icon(
                  Icons.money,
                  color: AppColors.kTextFieldColor,
                ),
                disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        width: 1, color: AppColors.kTextDividerColor))),
          ),
          const SizedBox(height: 20),
          TextFormField(
            enabled: false,
            controller: controller.ifsccodeController,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: Dimensions.font16,
              color: AppColors.kTextFieldColor,
              fontWeight: FontWeight.w600,
            ),
            decoration: const InputDecoration(
                label: Text("IFSC Code", textAlign: TextAlign.end,),
                labelStyle: TextStyle(
                  color: AppColors.kLabelColor,
                ),
                prefixIcon: Icon(
                  Icons.pin,
                  color: AppColors.kTextFieldColor,
                ),
                disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        width: 1, color: AppColors.kTextDividerColor))),
          ),
          const SizedBox(height: 20),
          TextFormField(
            enabled: false,
            controller: controller.branchNameController,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: Dimensions.font16,
              color: AppColors.kTextFieldColor,
              fontWeight: FontWeight.w600,
            ),
            decoration: const InputDecoration(
                label: Text("Branch Name", textAlign: TextAlign.end,),
                labelStyle: TextStyle(
                  color: AppColors.kLabelColor,
                ),
                prefixIcon: Icon(
                  Icons.location_city_outlined,
                  color: AppColors.kTextFieldColor,
                ),
                disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        width: 1, color: AppColors.kTextDividerColor))),
          ),
          const SizedBox(height: 20),
          TextFormField(
            enabled: false,
            controller: controller.bankAddressNameController,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: Dimensions.font16,
              color: AppColors.kTextFieldColor,
              fontWeight: FontWeight.w600,
            ),
            decoration: const InputDecoration(
                label: Text("Name as per Bank", textAlign: TextAlign.end,),
                labelStyle: TextStyle(
                  color: AppColors.kLabelColor,
                ),
                prefixIcon: Icon(
                  Icons.verified_user_outlined,
                  color: AppColors.kTextFieldColor,
                ),
                disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        width: 1, color: AppColors.kTextDividerColor))),
          ),
          const SizedBox(height: 20),
          TextFormField(
            enabled: false,
            controller: controller.pancardController,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: Dimensions.font16,
              color: AppColors.kTextFieldColor,
              fontWeight: FontWeight.w600,
            ),
            decoration: const InputDecoration(
                label: Text("Pan No.", textAlign: TextAlign.end,),
                labelStyle: TextStyle(
                  color: AppColors.kLabelColor,
                ),
                prefixIcon: Icon(
                  Icons.credit_card_outlined,
                  color: AppColors.kTextFieldColor,
                ),
                disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        width: 1, color: AppColors.kTextDividerColor))),
          ),
          const SizedBox(height: 20),
          TextFormField(
            enabled: false,
            controller: controller.aadharcardController,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: Dimensions.font16,
              color: AppColors.kTextFieldColor,
              fontWeight: FontWeight.w600,
            ),
            decoration: const InputDecoration(
                label: Text("AADHAR No.", textAlign: TextAlign.end,),
                labelStyle: TextStyle(
                  color: AppColors.kLabelColor,
                ),
                prefixIcon: Icon(
                  Icons.perm_identity_outlined,
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
