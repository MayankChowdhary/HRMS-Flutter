import 'package:avatar_glow/avatar_glow.dart';
import 'package:employee_attendance_flutter/app/core/utils/app_utils.dart';
import 'package:employee_attendance_flutter/app/data/service/controller/leave_controller.dart';
import 'package:employee_attendance_flutter/app/modules/applyleave/leave_arguments.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/colors/colors.dart';
import '../../core/utils/dimensions.dart';
import '../../core/utils/show_custom_snackbar.dart';

class LeavePage extends StatelessWidget {
  const LeavePage({Key? key}) : super(key: key);

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
            child: Text("LEAVES",
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
        body: GetBuilder<LeaveController>(builder: (controller) {
          try {
            final args = Get.arguments as LeaveArguments;
            controller.selectedDate = args.selectedDate;
            controller.isDateLocked = true;
            controller.refreshDate();
          } catch (e) {
            AppUtils.printMessage(e.toString());
          }
          return SingleChildScrollView(
              child: Column(children: [
            Center(
              child: Stack(children: [
                AvatarGlow(
                  glowColor: controller.leaveBalance.value > 0
                      ? AppColors.kPrimaryDeep
                      : AppColors.kMainBlackColor,
                  endRadius: Dimensions.height45 * 3.5,
                  duration: const Duration(milliseconds: 2000),
                  repeat: false,
                  showTwoGlows: false,
                  repeatPauseDuration: const Duration(milliseconds: 50),
                  child: Material(
                    // Replace this child with your own
                    elevation: 20.0,
                    shape: const CircleBorder(),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[100],
                      radius: Dimensions.height45 * 2.5,
                      child: SizedBox(
                        width: Dimensions.height45 * 5,
                        height: Dimensions.height45 * 5,
                        child: CircularProgressIndicator.adaptive(
                          value: controller.leaveBalanceProgress.value,
                          backgroundColor: AppColors.kGrayControlBack,
                          valueColor: const AlwaysStoppedAnimation<Color>(
                              AppColors.kPrimaryDeep),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            controller.leaveBalance.value.toString(),
                            style: TextStyle(
                                fontSize: Dimensions.font26,
                                color: AppColors.kMainBlackColor,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "Leaves Balance",
                            style: TextStyle(
                                fontSize: Dimensions.font16,
                                color: AppColors.kGrayColor,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      )),
                )
              ]),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "▪️  Total Leaves",
                        style: TextStyle(
                            fontSize: Dimensions.font10,
                            color: AppColors.kGrayColor,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        controller.leaveTotal.toString(),
                        style: TextStyle(
                            fontSize: Dimensions.font22,
                            color: AppColors.kMainBlackColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "▪️  Leaves Used",
                        style: TextStyle(
                            fontSize: Dimensions.font10,
                            color: AppColors.kGrayColor,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        controller.leaveUsed.toString(),
                        style: TextStyle(
                            fontSize: Dimensions.font22,
                            color: AppColors.kMainBlackColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            Text(
              "Apply For Leaves",
              style: TextStyle(
                  fontSize: Dimensions.font20,
                  color: AppColors.kBlackColor,
                  fontWeight: FontWeight.w500),
            ),
            const Divider(
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Start Date",
                        style: TextStyle(
                            fontSize: Dimensions.font20,
                            color: AppColors.kMainBlackColor,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (!controller.isDateLocked) {
                            controller.selectDate(context, true);
                          } else {
                            showCustomSnackBar("Date cannot be changed");
                          }
                        },
                        child: Card(
                          elevation: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text(
                              controller.startDateController.value,
                              style: TextStyle(
                                  fontSize: Dimensions.font12,
                                  color: AppColors.kMainBlackColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "End Date",
                        style: TextStyle(
                            fontSize: Dimensions.font20,
                            color: AppColors.kMainBlackColor,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (!controller.isDateLocked) {
                            controller.selectDate(context, false);
                          } else {
                            showCustomSnackBar("Date cannot be changed");
                          }
                        },
                        child: Card(
                          elevation: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text(
                              controller.endDateController.value,
                              style: TextStyle(
                                  fontSize: Dimensions.font12,
                                  color: AppColors.kMainBlackColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 40.0),
              child: TextFormField(
                enabled: true,
                maxLines: 3,
                controller: controller.reasonController,
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
                      "Enter reason",
                      textAlign: TextAlign.end,
                    ),
                    labelStyle: TextStyle(
                      color: AppColors.kSecondaryColor,
                    ),
                    disabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 1, color: AppColors.kTextDividerColor))),
              ),
            ),
            SizedBox(
              height: Dimensions.height45,
            ),
            Center(
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        AppColors.kPrimaryDeep),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: const BorderSide(
                                color: AppColors.kPrimaryDeep)))),
                onPressed: () {
                  if (controller.leaveBalance.value > 0) {
                    controller.applyLeaveRequest();
                  } else {
                    showCustomSnackBar(
                        title: "Leave Failure", "Your leave limit is over.");
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Submit",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: Dimensions.font18,
                        color: AppColors.kWhiteColor),
                  ),
                ),
              ),
            )
          ]));
        }));
  }
}
