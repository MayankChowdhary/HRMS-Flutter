import 'dart:convert';

import 'package:employee_attendance_flutter/app/core/colors/colors.dart';
import 'package:employee_attendance_flutter/app/core/utils/app_utils.dart';
import 'package:employee_attendance_flutter/app/data/model/attendance_model.dart';
import 'package:employee_attendance_flutter/app/data/model/holiday_model.dart';
import 'package:employee_attendance_flutter/app/data/service/repository/attendance_repo.dart';
import 'package:employee_attendance_flutter/app/data/service/repository/holiday_repo.dart';
import 'package:employee_attendance_flutter/app/data/service/repository/notification_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/utils/dialog_helper.dart';
import '../../../core/utils/dimensions.dart';
import '../../api/error_handling.dart';

class HolidayController extends GetxController with StateMixin<dynamic> {
  static HolidayController get to => Get.find();
  final ScrollController scrollController = ScrollController();
  final holidayList = Rxn< List<Holiday?>?>();

  @override
  void onReady() {
    super.onReady();
    getHolidays();
  }

  // void animateToIndex(int index) {
  //   scrollController.animateTo(
  //     index * widthMonthWidget,
  //     duration: const Duration(seconds: 1),
  //     curve: Curves.fastOutSlowIn,
  //   );
  //   update();
  // }

  void getHolidays() async {
    try {
      DialogHelper.showLoading();
      HolidayRepository().getHoliday().then((value) {
        var js = jsonDecode(value);
        HolidayRoot holidayRoot = HolidayRoot.fromJson(js);
        List<Holiday?>? holidaysList = holidayRoot.data;
        holidayList.value=holidaysList;
        DialogHelper.dismissLoader();
        update();
      }, onError: (e) {
        DialogHelper.dismissLoader();
        ErrorHandling.handleErrors(e);
      });
    } catch (e) {
      DialogHelper.dismissLoader();
      ErrorHandling.handleErrors(e);
    }
  }
}
