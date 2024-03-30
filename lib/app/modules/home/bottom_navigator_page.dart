import 'package:employee_attendance_flutter/app/data/service/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/colors/colors.dart';
import '../../core/utils/dimensions.dart';

class BottomNavigationPage extends StatelessWidget {
  const BottomNavigationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          top: false,
          child: controller.pages[controller.selectedIndex.value],
        ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: AppColors.kPrimaryDark,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black,
          iconSize: Dimensions.height20*1.3,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/ic_home.png",
                width: Dimensions.height20*1.3,
                height: Dimensions.height20*1.3,
              ),
              label: '',
              activeIcon: Image.asset(
                "assets/images/ic_home_active.png",
                width: Dimensions.height20*1.3,
                height: Dimensions.height20*1.3,
              ),
            ),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/images/ic_attendance.png",
                  width: Dimensions.height20*1.3,
                  height: Dimensions.height20*1.3,
                ),
                label: '',
                activeIcon: Image.asset(
                  "assets/images/ic_attendance_active.png",
                  width: Dimensions.height20*1.3,
                  height: Dimensions.height20*1.3,
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications_none,
                  size: Dimensions.height20*1.3,
                  color: AppColors.kMainBlackColor,
                ),
                label: '',
                activeIcon: Icon(Icons.notifications_none,
                  size: Dimensions.height20*1.3,
                  color: AppColors.kWhiteColor,
                ),),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/images/ic_profile.png",
                  width: Dimensions.height20*1.3,
                  height: Dimensions.height20*1.3,
                ),
                label: '',
                activeIcon: Image.asset(
                  "assets/images/ic_profile_active.png",
                  width: Dimensions.height20*1.3,
                  height: Dimensions.height20*1.3,
                )),
          ],
          onTap: controller.onTap,
          currentIndex: controller.selectedIndex.value,
          type: BottomNavigationBarType.fixed,
        ),
      );
    });
  }
}
