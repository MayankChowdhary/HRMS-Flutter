import 'dart:convert';

import 'package:employee_attendance_flutter/app/core/colors/colors.dart';
import 'package:employee_attendance_flutter/app/core/utils/app_utils.dart';
import 'package:employee_attendance_flutter/app/data/model/attendance_model.dart';
import 'package:employee_attendance_flutter/app/data/service/repository/attendance_repo.dart';
import 'package:employee_attendance_flutter/app/data/service/repository/notification_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/utils/dialog_helper.dart';
import '../../../core/utils/dimensions.dart';
import '../../api/error_handling.dart';

class NotificationController extends GetxController with StateMixin<dynamic> {
  static NotificationController get to => Get.find();
  final ScrollController scrollController = ScrollController();

  @override
  void onReady() {
    super.onReady();
    getNotifications();
  }

  // void animateToIndex(int index) {
  //   scrollController.animateTo(
  //     index * widthMonthWidget,
  //     duration: const Duration(seconds: 1),
  //     curve: Curves.fastOutSlowIn,
  //   );
  //   update();
  // }

  void getNotifications() async {
    try {
      DialogHelper.showLoading();
      NotificationRepository().getNotifications().then((value) {
        var js = jsonDecode(value);
      /*  LeaveStatusRoot leaveRoot = LeaveStatusRoot.fromJson(js);
        List<LeaveStatus?>? leaveStatus = leaveRoot.data;
        leaveStatusData(leaveStatus?.cast<LeaveStatus>());
        getTableData(leaveStatusData.value);*/
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
