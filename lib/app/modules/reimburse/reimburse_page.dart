import 'package:employee_attendance_flutter/app/core/utils/app_utils.dart';
import 'package:employee_attendance_flutter/app/modules/reimburse/reimburse_arguments.dart';
import 'package:employee_attendance_flutter/app/modules/reimburse/reimburse_form_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/colors/colors.dart';
import '../../core/utils/dimensions.dart';
import '../../data/service/controller/reimburse_controller.dart';

class ReimbursePage extends StatelessWidget {
  const ReimbursePage({Key? key}) : super(key: key);

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
            child: Text("Expense Reimbursement",
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
        body: GetBuilder<ReimburseController>(builder: (controller) {
          try {
            final args = Get.arguments as ReimburseArguments;
            controller.emailController.text = args.email;
            controller.userId = args.userId;
            /*   controller.selectedDate = args.selectedDate;
            controller.isDateLocked = true;
            controller.refreshDate();*/
          } catch (e) {
            AppUtils.printMessage(e.toString());
          }
          return SingleChildScrollView(
              controller: controller.scrollController,
              child: Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 20.0, top: 0, bottom: 0),
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
              GestureDetector(
                onTap: () {
                  controller.selectDate(context);
                },
                child: TextFormField(
                  enabled: false,
                  controller: controller.dobEditController,
                  // onChanged: (value) {
                  //   final editControl = controller.editControllers[index];
                  //
                  // },
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: Dimensions.font16,
                    color: AppColors.kTextFieldColor,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: const InputDecoration(
                      label: Text(
                        "Date",
                        textAlign: TextAlign.end,
                      ),
                      labelStyle: TextStyle(
                        color: AppColors.kSecondaryColor,
                      ),
                      prefixIcon: Icon(
                        Icons.date_range_outlined,
                        color: AppColors.kTextFieldColor,
                      ),
                      disabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: AppColors.kTextDividerColor))),
                ),
              ),
              SizedBox(
                height: Dimensions.height30,
              ),
              for ( int i=0;i<controller.count.value ;i++ )
              ReimburseItem(controller: controller, index: i),

              SizedBox(
                height: Dimensions.height10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.kPrimaryDeep,
                  minimumSize:
                      Size(Dimensions.height45 * 3, Dimensions.height45 * 1),
                ),
                onPressed: () {
                  controller.addItem();
                },
                child: const Text(
                  "Add more",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              //ReimburseItem(controller: controller, index: 0),
              TextFormField(
                enabled: true,
                controller: controller.upiController,
                maxLines: 1,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: Dimensions.font16,
                  color: AppColors.kTextFieldColor,
                  fontWeight: FontWeight.w600,
                ),
                decoration: const InputDecoration(
                    label: Text(
                      "UPI ID",
                      textAlign: TextAlign.end,
                    ),
                    labelStyle: TextStyle(
                      color: AppColors.kLabelColor,
                    ),
                    prefixIcon: Icon(
                      Icons.pin_outlined,
                      color: AppColors.kTextFieldColor,
                    ),
                    hintText: "PayTm/PhonePay etc.",
                    hintStyle: TextStyle(color: AppColors.kGrayColor),
                    disabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 1, color: AppColors.kTextDividerColor))),
              ),
              SizedBox(
                height: Dimensions.height30,
              ),
              TextFormField(
                enabled: false,
                controller: controller.totalController,
                maxLines: 1,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: Dimensions.font16,
                  color: AppColors.kTextFieldColor,
                  fontWeight: FontWeight.w600,
                ),
                decoration: const InputDecoration(
                    label: Text(
                      "Total Amount",
                      textAlign: TextAlign.end,
                    ),
                    labelStyle: TextStyle(
                      color: AppColors.kLabelColor,
                    ),
                    prefixIcon: Icon(
                      Icons.attach_money_outlined,
                      color: AppColors.kTextFieldColor,
                    ),
                    disabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 1, color: AppColors.kTextDividerColor))),
              ),
              SizedBox(
                height: Dimensions.height45,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.kSecondaryColor,
                  minimumSize: Size(
                      Dimensions.height45 * 6.0, Dimensions.height45 * 1.2),
                ),
                onPressed: () {
                  controller.applyReimbursement();
                },
                child: const Text(
                  "SUBMIT",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: Dimensions.height45,
              ),
            ]),
          ));
        }));
  }
}
