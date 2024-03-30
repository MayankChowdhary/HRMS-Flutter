import 'package:employee_attendance_flutter/app/data/service/controller/leave_controller.dart';
import 'package:get/get.dart';

class LeaveBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<LeaveController>(() => LeaveController());
  }
}