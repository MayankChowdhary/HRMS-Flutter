import 'package:employee_attendance_flutter/app/data/service/binding/attendance_binding.dart';
import 'package:employee_attendance_flutter/app/data/service/binding/holiday_binding.dart';
import 'package:employee_attendance_flutter/app/data/service/binding/id_card_binding.dart';
import 'package:employee_attendance_flutter/app/data/service/binding/leave_binding.dart';
import 'package:employee_attendance_flutter/app/data/service/binding/notification_binding.dart';
import 'package:employee_attendance_flutter/app/data/service/binding/profile_binding.dart';
import 'package:employee_attendance_flutter/app/data/service/binding/regularization_binding.dart';
import 'package:employee_attendance_flutter/app/modules/applyleave/leave_status_page.dart';
import 'package:employee_attendance_flutter/app/modules/attendance/attandence_page.dart';
import 'package:employee_attendance_flutter/app/modules/home/home_page.dart';
import 'package:employee_attendance_flutter/app/modules/idcard/id_card_page.dart';
import 'package:employee_attendance_flutter/app/modules/idcard/id_card_print_pdf.dart';
import 'package:employee_attendance_flutter/app/modules/notifications/notification_display_page.dart';
import 'package:employee_attendance_flutter/app/modules/profile/profile_edit_page.dart';
import 'package:employee_attendance_flutter/app/modules/profile/profile_page.dart';
import 'package:employee_attendance_flutter/app/modules/reimburse/reimburse_page.dart';
import 'package:employee_attendance_flutter/app/modules/reimburse/reimburse_status_page.dart';
import 'package:employee_attendance_flutter/app/modules/resignation/resignation_apply_page.dart';
import 'package:employee_attendance_flutter/app/modules/resignation/resignation_status_page.dart';
import 'package:employee_attendance_flutter/app/modules/settings/setting_page.dart';
import 'package:employee_attendance_flutter/app/modules/splash/splash_page.dart';
import 'package:get/get.dart';

import '../data/service/binding/home_binding.dart';
import '../data/service/binding/login_binding.dart';
import '../data/service/binding/reimburse_binding.dart';
import '../data/service/binding/resignation_binding.dart';
import '../data/service/binding/settings_binding.dart';
import '../modules/applyleave/leave_page.dart';
import '../modules/auth/login_page.dart';
import '../modules/holiday/holiday_display_page.dart';
import '../modules/home/bottom_navigator_page.dart';
import '../modules/regularization/regularization_display_page.dart';
import '../modules/regularization/regularization_page.dart';

class Routes{
  static const String splashPage = "/splash-page";
  static const String initialPage = "/";
  static const String loginPage = "/login-page";
  static const String attendancePAge = "/attendance-page";
  static const String navigationPage = "/navigation-page";
  static const String settingPage = "/setting-page";
  static const String profilePage = "/profile-page";
  static const String editProfilePage = "/edit-profile-page";
  static const String regularizationPage = "/regularization-page";
  static const String regularizationDisplay = "/regularization-display";
  static const String leavePage = "/leave-page";
  static const String leaveStatusPage = "/leave-status-page";
  static const String resinApplyPage = "/resign-apply-page";
  static const String resinStatusPage = "/resin-status-page";
  static const String idCardPage = "/id_card-page";
  static const String idCardPrintPdf = "/id_card-print-pdf";
  static const String reimburseApplyPage = "/reimburse-page";
  static const String reimburseStatusPage = "/reimburse-status-page";
  static const String notificationPage = "/notification-page";
  static const String holidayPage = "/holiday-page";

  ///Get routes
  static getSplashPage() => splashPage;
  static getInitialPage() => initialPage;
  static getLoginPage() => loginPage;
  static getAttendancePage() => attendancePAge;
  static getNavigationPage() => navigationPage;
  static getSettingPage() => settingPage;
  static getProfilePage() => profilePage;
  static getEditProfilePage() => editProfilePage;
  static getRegularizationPage() => regularizationPage;
  static getRegularizationDisplayPage() => regularizationDisplay;
  static getLeavePage() => leavePage;
  static getLeaveStatusPage() => leaveStatusPage;
  static getResignApplyPage() => resinApplyPage;
  static getResignStatusPage() => resinStatusPage;
  static getIdCardPage() => idCardPage;
  static getIdCardPrintPdf() => idCardPrintPdf;
  static getReimbursePage() => reimburseApplyPage;
  static getReimburseStatusPage() => reimburseStatusPage;
  static getNotificationPage() => notificationPage;
  static getHolidayPage() => holidayPage;

  static List<GetPage> routes = [
    GetPage(
        name: getSplashPage(),
        page: ()=>const SplashPage(),
        transition: Transition.fadeIn
    ),
    GetPage(
        name: getInitialPage(),
        page: ()=>const HomePage(),
        transition: Transition.fadeIn,
         binding:HomeBinding(),
    ),
    GetPage(
        name: getLoginPage(),
        page: ()=>const LoginPage(),
        transition: Transition.fadeIn,
      binding: LoginBinding()

    ),
    GetPage(
        name: getAttendancePage(),
        page: ()=>const AttendancePage(),
        transition: Transition.fadeIn,
        binding: AttendanceBinding()

    ),
    GetPage(
        name: getNavigationPage(),
        page: ()=>const BottomNavigationPage(),
        transition: Transition.fadeIn,
        binding: HomeBinding()
    ),
    GetPage(
        name: getSettingPage(),
        page: ()=>const SettingPage(),
        transition: Transition.fadeIn,
        binding: SettingsBinding()
    ),
    GetPage(
        name: getProfilePage(),
        page: ()=>const ProfilePage(),
        transition: Transition.fadeIn,
        binding: ProfileBinding()
    ),
    GetPage(
        name: getEditProfilePage(),
        page: ()=>const ProfileEditPage(),
        transition: Transition.fadeIn,
        binding: ProfileBinding()
    ),
    GetPage(
        name: getRegularizationPage(),
        page: ()=>const RegularizationPage(),
        transition: Transition.fadeIn,
        binding: RegularizationBinding()
    ),
    GetPage(
        name: getRegularizationDisplayPage(),
        page: ()=>const RegularizationDisplayPage(),
        transition: Transition.fadeIn,
        binding: RegularizationBinding()
    ),
    GetPage(
        name: getLeavePage(),
        page: ()=>const LeavePage(),
        transition: Transition.fadeIn,
        binding: LeaveBinding()
    ),
    GetPage(
        name: getLeaveStatusPage(),
        page: ()=>const LeaveStatusPage(),
        transition: Transition.fadeIn,
        binding: LeaveBinding()
    ),
    GetPage(
        name: getResignApplyPage(),
        page: ()=>const ResignationPage(),
        transition: Transition.fadeIn,
        binding: ResignationBinding()
    ),
    GetPage(
        name: getResignStatusPage(),
        page: ()=>const ResignationStatusPage(),
        transition: Transition.fadeIn,
        binding: ResignationBinding()
    ),
    GetPage(
        name: getIdCardPage(),
        page: ()=> IDCARDPage(),
        transition: Transition.fadeIn,
        binding: IDCARDBinding()
    ),
    GetPage(
        name: getIdCardPrintPdf(),
        page: ()=> IDCARDPrintPdf(),
        transition: Transition.fadeIn,
        binding: IDCARDBinding()
    ),
    GetPage(
        name: getReimbursePage(),
        page: ()=> const ReimbursePage(),
        transition: Transition.fadeIn,
        binding: ReimburseBinding()
    ),
    GetPage(
        name: getReimburseStatusPage(),
        page: ()=> const ReimburseStatusPage(),
        transition: Transition.fadeIn,
        binding: ReimburseBinding()
    ),
    GetPage(
        name: getNotificationPage(),
        page: ()=> const NotificationDisplayPage(),
        transition: Transition.fadeIn,
        binding: NotificationBinding()
    ),
    GetPage(
        name: getHolidayPage(),
        page: ()=> const HolidayPage(),
        transition: Transition.fadeIn,
        binding: HolidayBinding()
    ),
  ];

}