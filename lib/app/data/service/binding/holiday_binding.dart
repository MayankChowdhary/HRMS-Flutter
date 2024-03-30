import 'package:employee_attendance_flutter/app/data/service/controller/attandence_controller.dart';
import 'package:employee_attendance_flutter/app/data/service/controller/holiday_controller.dart';
import 'package:employee_attendance_flutter/app/data/service/controller/home_controller.dart';
import 'package:employee_attendance_flutter/app/data/service/controller/notification_controller.dart';
import 'package:get/get.dart';

class HolidayBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<HolidayController>(() => HolidayController());
  }
}