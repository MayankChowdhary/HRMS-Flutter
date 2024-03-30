import 'package:employee_attendance_flutter/app/core/utils/storage_utils.dart';
import 'package:employee_attendance_flutter/app/data/service/controller/home_controller.dart';
import 'package:employee_attendance_flutter/app/data/service/controller/settings_controller.dart';
import 'package:employee_attendance_flutter/app/modules/resignation/resignation_arguments.dart';
import 'package:employee_attendance_flutter/app/modules/settings/setting_item_tile_expandable.dart';
import 'package:employee_attendance_flutter/app/modules/settings/setting_item_tile_expanded.dart';
import 'package:employee_attendance_flutter/app/modules/settings/setting_item_tile_widget.dart';
import 'package:employee_attendance_flutter/app/routes/routes.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/colors/colors.dart';
import '../../core/utils/dimensions.dart';
import '../../data/api/error_handling.dart';
import '../../widgets/custom_dialog.dart';
import '../../widgets/page_header_widget.dart';
import '../home/like_us_widget.dart';
import '../idcard/id_card_arguments.dart';
import '../reimburse/reimburse_arguments.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<HomeController>(builder: (controller) {
      return SingleChildScrollView(
        child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
          SizedBox(
            height: Dimensions.height45 * 1.2,
          ),
          const HeaderTitle(text: "SETTINGS"),
          SizedBox(
            height: Dimensions.height45,
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.profilePage);
            },
            child: Column(
              children: [
                SizedBox(
                  width: Dimensions.iconsSize50 * 3.0,
                  height: Dimensions.iconsSize50 * 3.0,
                  child: AspectRatio(
                    aspectRatio: 1.1,
                    child: Image.network(
                      StorageUtils.instance.getProfilePic(),
                      fit: BoxFit.fitHeight,
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return Image.asset("assets/images/profile_pic.png");
                      },
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: Dimensions.height10),
                Text(StorageUtils.instance.getFullNAme(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: Dimensions.font20,
                        color: AppColors.kBlackColor)),
                SizedBox(height: Dimensions.height5),
                Text(StorageUtils.instance.getDesignation(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: Dimensions.font14)),
              ],
            ),
          ),
          SizedBox(
            height: Dimensions.height30,
          ),
          GestureDetector(
              onTap: () {
                Get.toNamed(Routes.profilePage);
              },
              child: const SettingTileWidget(
                text: "My Account",
                icon: Icons.account_circle_outlined,
              )),
              GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.idCardPage,arguments: IDCARDArguments(
                      controller.userDetails.value?.userid ?? "",
                        controller.userDetails.value?.firstname ?? "",
                        controller.userDetails.value?.lastname ?? "",
                      controller.professionDetails.value?.designation ?? "",
                      StorageUtils.instance.getProfilePic(),
                      controller.personalDetails.value?.dob ?? "",
                      controller.personalDetails.value?.gender ?? "",
                      "A+",
                      controller.userDetails.value?.phonenumber ?? "",
                      controller.userDetails.value?.email ?? "",
                    ));
                  },
                  child: const SettingTileWidget(
                    text: "ID-Card",
                    icon: Icons.credit_card_outlined,
                  )),
              GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.regularizationDisplay);
                  },
                  child: const SettingTileWidget(
                    text: "Regularization",
                    icon: Icons.view_timeline_outlined,
                  )),
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: 4, horizontal: Dimensions.height20),
                child: ExpandableNotifier(
                  child: ScrollOnExpand(
                    child: ExpandablePanel(
                      header: const SettingTileExpandableWidget(
                        text: "Leave",
                        icon: Icons.time_to_leave_outlined,
                      ),
                      collapsed: Container(),
                      expanded:Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.leavePage);
                            },
                            child: const SettingTileExpandedWidget(
                              text: "Apply Leave",
                              icon: Icons.time_to_leave,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.leaveStatusPage);
                            },
                            child: const SettingTileExpandedWidget(
                              text: "Leave Status",
                              icon: Icons.timelapse_outlined,
                            ),
                          ),
                        ],
                      ),
                      theme: ExpandableThemeData(
                          headerAlignment: ExpandablePanelHeaderAlignment.center,
                          tapBodyToCollapse: true,
                          tapHeaderToExpand: true,
                          iconSize: Dimensions.iconsSize24,
                          hasIcon: true,
                          expandIcon: Icons.arrow_forward_ios_rounded,
                          collapseIcon: Icons.arrow_back_ios_new_rounded,
                          iconColor: AppColors.kTextColor),
                    ),
                  ),
                ),
              ),
              const Divider(thickness: 1),
          Container(
            padding: EdgeInsets.symmetric(
                vertical: 4, horizontal: Dimensions.height20),
            child: ExpandableNotifier(
              child: ScrollOnExpand(
                child: ExpandablePanel(
                  header: const SettingTileExpandableWidget(
                    text: "More",
                    icon: Icons.more_vert_outlined,
                  ),
                  collapsed: Container(),
                  expanded:Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.resinApplyPage,  arguments: ResignationArguments(
                            controller.userDetails.value?.userid ?? "",
                            controller.userDetails.value?.email.toString() ?? "",));
                        },
                        child: const SettingTileExpandedWidget(
                          text: "Apply Resignation",
                          icon: Icons.dangerous_outlined,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.resinStatusPage,arguments: ResignationArguments(
                            controller.userDetails.value?.userid ?? "",
                            controller.userDetails.value?.email.toString() ?? "",));
                        },
                        child: const SettingTileExpandedWidget(
                          text: "Resignation Status",
                          icon: Icons.timelapse_outlined,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.reimburseApplyPage,  arguments: ReimburseArguments(
                            controller.userDetails.value?.userid ?? "",
                            controller.userDetails.value?.email.toString() ?? "",));
                        },
                        child: const SettingTileExpandedWidget(
                          text: "Apply Reimbursement",
                          icon: Icons.monetization_on_outlined,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.reimburseStatusPage,arguments: ResignationArguments(
                            controller.userDetails.value?.userid ?? "",
                            controller.userDetails.value?.email.toString() ?? "",));
                        },
                        child: const SettingTileExpandedWidget(
                          text: "Reimbursement Status",
                          icon: Icons.timelapse_outlined,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.holidayPage);
                        },
                        child: const SettingTileExpandedWidget(
                          text: "Holidays",
                          icon: Icons.calendar_month_outlined,
                        ),
                      ),
                    ],
                  ),
                  theme: ExpandableThemeData(
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      tapBodyToCollapse: true,
                      tapHeaderToExpand: true,
                      iconSize: Dimensions.iconsSize24,
                      hasIcon: true,
                      expandIcon: Icons.arrow_forward_ios_rounded,
                      collapseIcon: Icons.arrow_back_ios_new_rounded,
                      iconColor: AppColors.kTextColor),
                ),
              ),
            ),
          ),
          GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const CustomDialog(
                          message: "Are you sure you want to log out?",
                          onOk: ErrorHandling.logout);
                    });
              },
              child: const SettingTileWidget(
                text: "Logout",
                icon: Icons.logout,
              )),
          SizedBox(
            height: Dimensions.height10,
          ),
          const LikeUsWidget(),
          SizedBox(
            height: Dimensions.height20,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              "App Version \n      v${controller.versionName.value}",
              style: TextStyle(
                  fontSize: Dimensions.font16,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey),
            ),
          ),
        ]),
      );
    }));
  }
}
