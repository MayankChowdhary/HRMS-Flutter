import 'dart:io';

import 'package:employee_attendance_flutter/app/core/colors/colors.dart';
import 'package:employee_attendance_flutter/app/core/utils/app_utils.dart';
import 'package:employee_attendance_flutter/app/core/utils/storage_utils.dart';
import 'package:employee_attendance_flutter/app/data/service/controller/profile_controller.dart';
import 'package:employee_attendance_flutter/app/data/service/repository/profile_repo.dart';
import 'package:employee_attendance_flutter/app/modules/profile/bank_details_widget.dart';
import 'package:employee_attendance_flutter/app/modules/profile/family_details_widget.dart';
import 'package:employee_attendance_flutter/app/modules/profile/personal_details_widget.dart';
import 'package:employee_attendance_flutter/app/modules/profile/professional_details_widget.dart';
import 'package:employee_attendance_flutter/app/modules/profile/user_details_widget.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/utils/dimensions.dart';
import '../../widgets/no_data_light_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  Future<void> showOptionsDialog(
      BuildContext context, ProfileController controller) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Center(child: Text("Options")),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  GestureDetector(
                    child: Row(
                      children: const [
                        Icon(Icons.camera_alt_outlined),
                        SizedBox(width: 6,),
                        Text("Capture From Camera"),
                      ],
                    ),
                    onTap: () async {
                      final picker = ImagePicker();
                      await picker
                          .pickImage(
                              source: ImageSource.camera,
                              maxWidth: 800,
                              maxHeight: 800)
                          .then((value) async {
                        AppUtils.cropImage(context, value?.path ?? "")
                            .then((value) {
                          Get.back();
                          ProfileRepository().updateProfilePicture(
                              File(value?.path ?? ""),
                              controller.userInfo.value?.userid ?? "").then((value) => {
                            controller.getUserData()
                          });;
                        });
                      });
                    },
                  ),
                  const Padding(padding: EdgeInsets.all(10)),
                  GestureDetector(
                    child: Row(
                      children: const [
                        Icon(Icons.image_outlined),
                        SizedBox(width: 6,),
                        Text("Choose From Gallery"),
                      ],
                    ),
                    onTap: () async {
                      final picker = ImagePicker();
                      AppUtils.printMessage("Image picking start");
                      await picker
                          .pickImage(
                              source: ImageSource.gallery,
                              maxWidth: 800,
                              maxHeight: 800)
                          .then((value) async {
                        AppUtils.cropImage(context, value?.path ?? "")
                            .then((value) {
                          Get.back();
                          ProfileRepository().updateProfilePicture(
                              File(value?.path ?? ""),
                              controller.userInfo.value?.userid ?? "").then((value) => {
                                controller.getUserData()
                          });
                        });
                      });
                    },
                    // openGallery();
                  ),
                ],
              ),
            ),
          );
        });
  }

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
            child: Text("MY ACCOUNT",
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
        body: GetBuilder<ProfileController>(builder: (controller) {
          return SingleChildScrollView(
              child: Column(children: [
            SizedBox(
              height: Dimensions.height45,
            ),
            SizedBox(
                width: Dimensions.iconsSize50 * 3.3,
                height: Dimensions.iconsSize50 * 3.3,
                child: Stack(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(4.0),
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
                  Positioned(
                    right: 0,
                    bottom: 10,
                    child: GestureDetector(
                      onTap: () {
                        showOptionsDialog(context, controller);
                      },
                      child: Container(
                          width: Dimensions.iconsSize16 * 1.2,
                          height: Dimensions.iconsSize16 * 1.2,
                          decoration: const BoxDecoration(
                            color: AppColors.kGreenDark,
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.0)),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.camera_alt_outlined,
                              color: AppColors.kWhiteColor,
                              size: Dimensions.iconsSize16,
                            ),
                          )),
                    ),
                  )
                ])),
            Text(
                "${controller.userInfo.value?.firstname ?? "Unknown"} ${controller.userInfo.value?.lastname ?? ""}",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: Dimensions.font20,
                    color: AppColors.kBlackColor)),
            SizedBox(height: Dimensions.height5),
            Text(
                controller.professional.value?.designation ??
                    "Unknown profession",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w500, fontSize: Dimensions.font14)),
            SizedBox(height: Dimensions.height10),
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: 4, horizontal: Dimensions.height20),
              child: ExpandableNotifier(
                child: ExpandablePanel(
                  header: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text("User",
                        style: TextStyle(
                            fontSize: Dimensions.font14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.kSecondaryColor)),
                  ),
                  collapsed: Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 8.0, top: 2, bottom: 2),
                    child:UserDetailsWidget(controller: controller),
                  ),
                  expanded: Container(),
                  theme: ExpandableThemeData(
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      tapBodyToCollapse: true,
                      tapHeaderToExpand: true,
                      iconSize: Dimensions.iconsSize32,
                      hasIcon: true,
                      expandIcon: Icons.keyboard_arrow_up,
                      collapseIcon: Icons.keyboard_arrow_down,
                      iconColor: AppColors.kSecondaryColor),
                ),
              ),
            ),
            Container(
              width: 30,
              height: 1,
              color: AppColors.kTextDividerColor,
            ),
            SizedBox(height: Dimensions.height10),
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: 4, horizontal: Dimensions.height20),
              child: ExpandableNotifier(
                child: ScrollOnExpand(
                  child: ExpandablePanel(
                    header: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text("Professional",
                          style: TextStyle(
                              fontSize: Dimensions.font14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.kSecondaryColor)),
                    ),
                    collapsed: Container(),
                    expanded: Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8.0, top: 2, bottom: 2),
                      child: ProfessionalDetailsWidget(controller: controller),
                    ),
                    theme: ExpandableThemeData(
                        headerAlignment: ExpandablePanelHeaderAlignment.center,
                        tapBodyToCollapse: true,
                        tapHeaderToExpand: true,
                        iconSize: Dimensions.iconsSize32,
                        hasIcon: true,
                        expandIcon: Icons.keyboard_arrow_down,
                        collapseIcon: Icons.keyboard_arrow_up,
                        iconColor: AppColors.kSecondaryColor),
                  ),
                ),
              ),
            ),
            Container(
              width: 30,
              height: 1,
              color: AppColors.kTextDividerColor,
            ),
            SizedBox(height: Dimensions.height10),
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: 4, horizontal: Dimensions.height20),
              child: ExpandableNotifier(
                child: ScrollOnExpand(
                  child: ExpandablePanel(
                    header: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text("Personal",
                          style: TextStyle(
                              fontSize: Dimensions.font14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.kSecondaryColor)),
                    ),
                    collapsed: Container(),
                    expanded: Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8.0, top: 2, bottom: 2),
                      child:  PersonalDetailsWidget(controller: controller),
                    ),
                    theme: ExpandableThemeData(
                        headerAlignment: ExpandablePanelHeaderAlignment.center,
                        tapBodyToCollapse: true,
                        tapHeaderToExpand: true,
                        iconSize: Dimensions.iconsSize32,
                        hasIcon: true,
                        expandIcon: Icons.keyboard_arrow_down,
                        collapseIcon: Icons.keyboard_arrow_up,
                        iconColor: AppColors.kSecondaryColor),
                  ),
                ),
              ),
            ),
            Container(
              width: 30,
              height: 1,
              color: AppColors.kTextDividerColor,
            ),
            SizedBox(height: Dimensions.height10),
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: 4, horizontal: Dimensions.height20),
              child: ExpandableNotifier(
                child: ScrollOnExpand(
                  child: ExpandablePanel(
                    header: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text("Family",
                          style: TextStyle(
                              fontSize: Dimensions.font14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.kSecondaryColor)),
                    ),
                    collapsed: Container(),
                    expanded: Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8.0, top: 2, bottom: 2),
                      child:FamilyDetailsWidget(controller: controller),
                    ),
                    theme: ExpandableThemeData(
                        headerAlignment: ExpandablePanelHeaderAlignment.center,
                        tapBodyToCollapse: true,
                        tapHeaderToExpand: true,
                        iconSize: Dimensions.iconsSize32,
                        hasIcon: true,
                        expandIcon: Icons.keyboard_arrow_down,
                        collapseIcon: Icons.keyboard_arrow_up,
                        iconColor: AppColors.kSecondaryColor),
                  ),
                ),
              ),
            ),
            Container(
              width: 30,
              height: 1,
              color: AppColors.kTextDividerColor,
            ),
            SizedBox(height: Dimensions.height10),
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: 4, horizontal: Dimensions.height20),
              child: ExpandableNotifier(
                child: ScrollOnExpand(
                  child: ExpandablePanel(
                    header: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text("Bank",
                          style: TextStyle(
                              fontSize: Dimensions.font14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.kSecondaryColor)),
                    ),
                    collapsed: Container(),
                    expanded: Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8.0, top: 2, bottom: 2),
                      child: BankDetailsWidget(controller: controller),
                    ),
                    theme: ExpandableThemeData(
                        headerAlignment: ExpandablePanelHeaderAlignment.center,
                        tapBodyToCollapse: true,
                        tapHeaderToExpand: true,
                        iconSize: Dimensions.iconsSize32,
                        hasIcon: true,
                        expandIcon: Icons.keyboard_arrow_down,
                        collapseIcon: Icons.keyboard_arrow_up,
                        iconColor: AppColors.kSecondaryColor),
                  ),
                ),
              ),
            ),
            Container(
              width: 30,
              height: 1,
              color: AppColors.kTextDividerColor,
            ),
            const SizedBox(height: 50)
          ]));
        }));
  }
}
