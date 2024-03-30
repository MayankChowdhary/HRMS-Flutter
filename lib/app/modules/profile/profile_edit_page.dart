import 'package:employee_attendance_flutter/app/core/colors/colors.dart';
import 'package:employee_attendance_flutter/app/core/utils/app_utils.dart';
import 'package:employee_attendance_flutter/app/data/service/controller/profile_controller.dart';
import 'package:employee_attendance_flutter/app/modules/profile/profile_edit_arguments.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import '../../core/utils/dimensions.dart';

class ProfileEditPage extends StatelessWidget {
  const ProfileEditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as ProfileEditArguments;
    final Map editableMap = args.editableItems;
    final Map extraItems = args.extraItems;
    AppUtils.printMessage("ExtraSize: ${extraItems.keys.length}");
    final int action = args.action;

    return Scaffold(
        resizeToAvoidBottomInset : false,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text("Edit Profile",
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
        body: GetBuilder<ProfileController>( builder: (controller) {
          controller.editControllers =
              List.generate(editableMap.length, (i) => TextEditingController());
          //AppUtils.printMessage("Print check: "+controller.personalInfo.value.)
          return Column(
            children: [
              SizedBox(
                height: Dimensions.screenHeight-(Dimensions.height45*5),
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      SizedBox(
                        width: Dimensions.screenWidth,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: editableMap.length,
                            itemBuilder: (BuildContext context, int index) {
                              String key = editableMap.keys.elementAt(index);
                              controller.editControllers[index].text =
                                  editableMap[key];
                              return Column(
                                children: <Widget>[
                                  TextFormField(
                                    enabled: true,
                                    controller: controller.editControllers[index],
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
                                    decoration: InputDecoration(
                                        label: Text(
                                          key,
                                          textAlign: TextAlign.end,
                                        ),
                                        labelStyle: const TextStyle(
                                          color: AppColors.kSecondaryColor,
                                        ),
                                        prefixIcon:  Icon(
                                         AppUtils.getEditIcon(key),
                                          color: AppColors.kTextFieldColor,
                                        ),
                                        disabledBorder: const UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 1,
                                                color: AppColors.kTextDividerColor))),
                                  ),
                                  const Divider(
                                    height: 2.0,
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (String item in extraItems.keys)... {
                            if(item=='Address Type')...{
                              Padding(
                                padding:
                                EdgeInsets.only(left: Dimensions.height45*1.2, right: 20.0, top:Dimensions.height10 ),
                                child: Text(
                                  "Address Type",
                                  style: TextStyle(
                                      color: AppColors.kSecondaryColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: Dimensions.font12),
                                ),
                              ),
                              Padding(
                                padding:  EdgeInsets.only(left: 15.0, right: 20.0, top: Dimensions.height5*0.5, bottom: Dimensions.height5*0.5),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.not_listed_location_outlined,
                                      color: AppColors.kTextFieldColor,
                                    ),
                                    SizedBox(width: Dimensions.height15,),
                                    DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        isDense: true,
                                        value: controller.addressTypeEditController.value,
                                        items: <String>['N/A','Permanent', 'Temporary'].map((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value, style:  TextStyle(  fontSize: Dimensions.font16,
                                              color: AppColors.kTextFieldColor,
                                              fontWeight: FontWeight.w600,),),
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          if(value!=null) {
                                            controller.addressTypeEditController.value = value;
                                            controller.update();
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(
                                height: 2.0,
                                color: AppColors.kGrayDark,

                              ),

                            },
                            if(item=='Date of birth')...{
                              GestureDetector(
                                onTap: (){
                                  controller.selectDate(context);
                                },
                                child:   TextFormField(
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
                                  decoration: InputDecoration(
                                      label: Text(
                                        item,
                                        textAlign: TextAlign.end,
                                      ),
                                      labelStyle: const TextStyle(
                                        color: AppColors.kSecondaryColor,
                                      ),
                                      prefixIcon: const Icon(
                                        Icons.cake_outlined,
                                        color: AppColors.kTextFieldColor,
                                      ),
                                      disabledBorder: const UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1,
                                              color: AppColors.kTextDividerColor))),
                                ),

                              )

                            },
                            if(item=='Gender')...{
                              const Divider(
                                height: 2.0,
                                color: AppColors.kGrayDark,

                              ),
                                Padding(
                                  padding:
                                       EdgeInsets.only(left: Dimensions.height45*1.2, right: 20.0, top:Dimensions.height10 ),
                                  child: Text(
                                    "Gender",
                                    style: TextStyle(
                                        color: AppColors.kSecondaryColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: Dimensions.font12),
                                  ),
                                ),
                                Padding(
                            padding:  EdgeInsets.only(left: 15.0, right: 20.0, top: Dimensions.height5*0.5, bottom: Dimensions.height5*0.5),
                             child: Row(
                                children: [
                                  const Icon(
                                    Icons.male,
                                    color: AppColors.kTextFieldColor,
                                  ),
                                  SizedBox(width: Dimensions.height15,),
                                  DropdownButtonHideUnderline(
                                   child: DropdownButton<String>(
                                     isDense: true,
                                    value: controller.genderEditController.value,
                                    items: <String>['N/A','Male', 'Female'].map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value, style:  TextStyle(  fontSize: Dimensions.font16,
                                          color: AppColors.kTextFieldColor,
                                          fontWeight: FontWeight.w600,),),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      if(value!=null) {
                                        controller.genderEditController.value = value;
                                        controller.update();
                                      }
                                    },
                                  ),
                                  ),
                                ],
                              ),
                            ),
                                const Divider(
                                height: 2.0,
                              ),

                            },
                            if(item=='Blood Group')...{
                              const Divider(
                                height: 2.0,
                                color: AppColors.kGrayDark,

                              ),
                                Padding(
                                  padding:
                                       EdgeInsets.only(left: Dimensions.height45*1.2, right: 20.0, top:Dimensions.height10 ),
                                  child: Text(
                                    "Blood Group",
                                    style: TextStyle(
                                        color: AppColors.kSecondaryColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: Dimensions.font12),
                                  ),
                                ),
                                Padding(
                            padding:  EdgeInsets.only(left: 15.0, right: 20.0, top: Dimensions.height5*0.5, bottom: Dimensions.height5*0.5),
                             child: Row(
                                children: [
                                  const Icon(
                                    Icons.bloodtype_outlined,
                                    color: AppColors.kTextFieldColor,
                                  ),
                                  SizedBox(width: Dimensions.height15,),
                                  DropdownButtonHideUnderline(
                                   child: DropdownButton<String>(
                                     isDense: true,
                                    value: controller.bloogEditController.value,
                                    items: <String>['N/A','A+', 'A-', 'B+', 'B-', 'O+', 'O-',  'AB+', 'AB-'].map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value, style:  TextStyle(  fontSize: Dimensions.font16,
                                          color: AppColors.kTextFieldColor,
                                          fontWeight: FontWeight.w600,),),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      if(value!=null) {
                                        controller.bloogEditController.value = value;
                                        controller.update();
                                      }
                                    },
                                  ),
                                  ),
                                ],
                              ),
                            ),
                                const Divider(
                                height: 2.0,
                              ),

                            },
                          },
                        ],
                      ),
                    ),
                    ])),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.kSecondaryColor,
                  minimumSize: Size(
                      Dimensions.height45 * 6.0, Dimensions.height45 * 1.2),
                ),
                onPressed: () {
                  controller.updateProfile(action);
                },
                child: const Text(
                  "SUBMIT",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(height: 10,),
            ],
          );
        }));
  }
}
