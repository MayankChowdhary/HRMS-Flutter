import 'package:employee_attendance_flutter/app/data/service/controller/attandence_controller.dart';
import 'package:employee_attendance_flutter/app/data/service/controller/home_controller.dart';
import 'package:employee_attendance_flutter/app/data/service/controller/id_card_controller.dart';
import 'package:get/get.dart';

class IDCARDBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<IDCARDController>(() => IDCARDController());
  }
}