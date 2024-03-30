import 'package:employee_attendance_flutter/app/core/colors/colors.dart';
import 'package:employee_attendance_flutter/app/core/utils/dimensions.dart';
import 'package:employee_attendance_flutter/app/data/service/controller/login_controller.dart';
import 'package:employee_attendance_flutter/app/modules/home/like_us_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<LoginController>(builder: (controller) {
      return SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Dimensions.height45 * 1.5,
            ),
            SizedBox(
              height: Dimensions.height45 * 1.8,
              child: Image.asset("assets/images/logo/logo.png"),
            ),
            SizedBox(
              height: Dimensions.height45,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome to ",
                  style: TextStyle(
                      fontSize: Dimensions.font26, fontWeight: FontWeight.w500),
                ),
                Text(
                  "TYS",
                  style: TextStyle(
                      fontSize: Dimensions.font26, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            Text(
              "eAttendance",
              style: TextStyle(
                  fontSize: Dimensions.font26, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: Dimensions.height15,
            ),
            //indicator
            Container(
              height: 2,
              width: Dimensions.width30,
              decoration: BoxDecoration(
                  color: AppColors.kBlackColor,
                  borderRadius: BorderRadius.circular(1)),
            ),

            SizedBox(
              height: Dimensions.height15,
            ),
            Container(
              height: Dimensions.height45 * 8,
              margin: EdgeInsets.symmetric(horizontal: Dimensions.width20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.kGrayColor.withOpacity(0.5),
                        blurRadius: Dimensions.radius10 / 2,
                        offset: const Offset(1, 5))
                  ]),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.kWhiteColor,
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: Dimensions.width45,
                          ),
                          const Text(
                            "Username",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      TextField(
                        controller: controller.textFieldEmail,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            hintText: "Enter your official email id"),
                      ),
                      SizedBox(
                        height: Dimensions.height30,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: Dimensions.width45,
                          ),
                          const Text(
                            "Password",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      TextField(
                        controller: controller.textFieldPassword,
                        obscureText: !controller.isPasswordVisible.value,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock),
                          hintText: "Enter password",
                          suffixIcon: IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                controller.isPasswordVisible.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: AppColors.kPrimaryDark,
                              ),
                              onPressed: () {
                                // Update the state i.e. toogle the state of passwordVisible variable
                                controller.onPasswordToggle();
                              }),
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height30,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            controller.validate();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.kSecondaryColor,
                              textStyle: TextStyle(
                                  fontSize: Dimensions.font24,
                                  fontWeight: FontWeight.w500),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius30))),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.width45 * 1.5,
                                vertical: Dimensions.height10),
                            child: const Text("Login"),
                          ))
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Dimensions.height45 * 1.6,
            ),
           const LikeUsWidget()
          ],
        ),
      );
    }));
  }


}
