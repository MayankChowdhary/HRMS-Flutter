import 'package:employee_attendance_flutter/app/data/service/controller/attandence_controller.dart';
import 'package:employee_attendance_flutter/app/data/service/controller/home_controller.dart';
import 'package:employee_attendance_flutter/app/data/service/controller/regularization_controller.dart';
import 'package:employee_attendance_flutter/app/data/service/controller/settings_controller.dart';
import 'package:get/get.dart';

class RegularizationBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<RegularizationController>(() => RegularizationController());
  }
}