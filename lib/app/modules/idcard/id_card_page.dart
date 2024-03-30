import 'package:employee_attendance_flutter/app/core/utils/app_utils.dart';
import 'package:employee_attendance_flutter/app/core/utils/constants.dart';
import 'package:employee_attendance_flutter/app/data/service/controller/id_card_controller.dart';
import 'package:employee_attendance_flutter/app/modules/idcard/id_card_arguments.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/colors/colors.dart';
import '../../core/utils/dimensions.dart';
import '../../core/utils/storage_utils.dart';
import '../../routes/routes.dart';

class IDCARDPage extends StatelessWidget {
   IDCARDPage({Key? key}) : super(key: key);
  IDCARDArguments? args;
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
            child: Text("ID-Card",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.kMainBlackColor,
                  fontWeight: FontWeight.bold,
                  fontSize: Dimensions.font20,
                )),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 6.0, right: 6.0),
              child: TextButton(
                onPressed: () {
                  Get.toNamed(Routes.idCardPrintPdf, arguments: args );
                },
                child: const Text(
                  '🖨️ PRINT',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: AppColors.kMainBlackColor),
                ),
              ),
            ),
          ],
          elevation: 0,
          backgroundColor: AppColors.kTransparentColor,
        ),
        body: GetBuilder<IDCARDController>(builder: (controller) {
          try {
             args = Get.arguments as IDCARDArguments;
              controller.setIDCard(args!);
          } catch (e) {
            AppUtils.printMessage(e.toString());
          }
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(Dimensions.height15),
              child: Column(
                children: [
                  Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/id_front.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: Dimensions.height30,
                              ),
                              CircleAvatar(
                                backgroundColor: AppColors.kSecondaryColor,
                                radius: Dimensions.height45 * 2.0,
                                child: CircleAvatar(
                                  radius: Dimensions.height45 * 1.9,
                                  backgroundImage: NetworkImage(
                                      StorageUtils.instance.getProfilePic()),
                                ),
                              ),
                              SizedBox(
                                height: Dimensions.height20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8.0),
                                child: FittedBox(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                          "${controller.idCardDetails.value?.firstName}" ??
                                              "",
                                          style: TextStyle(
                                              fontSize: Dimensions.font32,
                                              fontWeight: FontWeight.w700,
                                              color: AppColors.kWhiteColor)),
                                      SizedBox(
                                        width: Dimensions.height10,
                                      ),
                                      Text(
                                          "${controller.idCardDetails.value?.lastName}" ??
                                              "",
                                          style: TextStyle(
                                              fontSize: Dimensions.font32,
                                              fontWeight: FontWeight.w700,
                                              color: AppColors.kSecondaryColor))
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: Dimensions.height5,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8.0),
                                child: FittedBox(
                                  child: Text(
                                      "${controller.idCardDetails.value?.designation}" ??
                                          "",
                                      style: TextStyle(
                                          fontSize: Dimensions.font16,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.kWhiteColor)),
                                ),
                              ),
                              SizedBox(
                                height: Dimensions.height45 * 2.5,
                              ),
                            ],
                          ) /* add child content here */,
                        ),
                        SizedBox(
                          height: Dimensions.height15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: Dimensions.height40),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.verified_user,
                                    color: AppColors.kPrimaryDark,
                                  ),
                                  SizedBox(
                                    width: Dimensions.height45,
                                  ),
                                  Text(
                                      controller.idCardDetails.value?.userID ??
                                          "",
                                      style: TextStyle(
                                          fontSize: Dimensions.font20,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.kMainBlackColor))
                                ],
                              ),
                              SizedBox(
                                height: Dimensions.height10,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.cake,
                                    color: AppColors.kPrimaryDark,
                                  ),
                                  SizedBox(
                                    width: Dimensions.height45,
                                  ),
                                  Text(
                                      AppUtils.getStandardFormat(AppUtils.getReversedDate("08/02/1998")) ,
                                      style: TextStyle(
                                          fontSize: Dimensions.font16,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.kMainBlackColor))
                                ],
                              ),
                              SizedBox(
                                height: Dimensions.height10,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.accessibility_new,
                                    color: AppColors.kPrimaryDark,
                                  ),
                                  SizedBox(
                                    width: Dimensions.height45,
                                  ),
                                  Text(
                                      controller.idCardDetails.value?.gender ==
                                              "ML"
                                          ? "Male"
                                          : controller.idCardDetails.value
                                                      ?.gender ==
                                                  "FL"
                                              ? "Female"
                                              : "NA",
                                      style: TextStyle(
                                          fontSize: Dimensions.font16,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.kMainBlackColor)),
                                ],
                              ),
                              SizedBox(
                                height: Dimensions.height10,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.bloodtype,
                                    color: AppColors.kPrimaryDark,
                                  ),
                                  SizedBox(
                                    width: Dimensions.height45,
                                  ),
                                  Text(
                                      controller.idCardDetails.value
                                              ?.bloodGroup ??
                                          "NA",
                                      style: TextStyle(
                                          fontSize: Dimensions.font16,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.kMainBlackColor))
                                ],
                              ),
                              SizedBox(
                                height: Dimensions.height10,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.phone,
                                    color: AppColors.kPrimaryDark,
                                  ),
                                  SizedBox(
                                    width: Dimensions.height45,
                                  ),
                                  Text(
                                      controller.idCardDetails.value
                                          ?.phone ??
                                          "NA",
                                      style: TextStyle(
                                          fontSize: Dimensions.font16,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.kMainBlackColor))
                                ],
                              ),
                              SizedBox(
                                height: Dimensions.height10,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.webhook,
                                    color: AppColors.kPrimaryDark,
                                  ),
                                  SizedBox(
                                    width: Dimensions.height40,
                                  ),
                                  Text(AppConstants.kCompanyWebPAge,
                                      style: TextStyle(
                                          fontSize: Dimensions.font16,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.kMainBlackColor))
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.height45,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.height45,
                  ),
                  Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/id_back.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: SizedBox(
                            height: Dimensions.height45 * 8,
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.height30,
                        ),
                        Image.asset(
                          "assets/images/back_qr.png",
                          width: Dimensions.height45 * 3,
                          height: Dimensions.height45 * 3,
                        ),
                        SizedBox(
                          height: Dimensions.height15,
                        ),
                        Padding(
                          padding: EdgeInsets.all(Dimensions.height20),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.location_on_outlined,
                                color: AppColors.kPrimaryDark,
                              ),
                              SizedBox(
                                width: Dimensions.height40,
                              ),
                              Flexible(
                                child: Text(AppConstants.kCompanyAddress,
                                    style: TextStyle(
                                        fontSize: Dimensions.font16,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.kMainBlackColor)),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.height20,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }));
  }
}
