import 'dart:convert';

import 'package:employee_attendance_flutter/app/core/colors/colors.dart';
import 'package:employee_attendance_flutter/app/core/utils/app_utils.dart';
import 'package:employee_attendance_flutter/app/data/model/attendance_model.dart';
import 'package:employee_attendance_flutter/app/data/service/repository/attendance_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/utils/dialog_helper.dart';
import '../../../core/utils/dimensions.dart';
import '../../api/error_handling.dart';

class AttendanceController extends GetxController with StateMixin<dynamic> {
  static AttendanceController get to => Get.find();
  final ScrollController scrollController = ScrollController();
  final double widthMonthWidget = Dimensions.height45 * 1.8;

  final attendanceData = <Attendance>[].obs;
  final attendanceChart = Rxn<AttendanceCount>();
  final workingDays = "NA".obs;
  final totalDays = "NA".obs;
  final totalHours = "NA".obs;
  final maxHours = "NA".obs;
  final presentCount = "NA".obs;
  final absentCount = "NA".obs;
  final leaveCount = "NA".obs;
  final halfDayCount = "NA".obs;
  final lateCount = "NA".obs;
  final selectedYear = Rxn<DateTime>(DateTime.now());

  final chartMap = {
    "Present": 0.toDouble(),
    "Absent": 0.toDouble(),
    "Late": 0.toDouble(),
    "Half Day": 0.toDouble(),
    "Leave": 0.toDouble()
  }.obs;

  final chartColorList = <Color>[
    AppColors.kChartPresent,
    AppColors.kChartAbsent,
    AppColors.kChartLate,
    AppColors.kChartHalfDay,
    AppColors.kChartLeave,
  ];

  final List<String> months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];
  final selectedMonth = AppUtils.getCurrentMonth().obs;

  @override
  void onReady() {
    super.onReady();
    getAttendanceData(
        selectedMonth.value, AppUtils.getYearFromDate(selectedYear.value));
  }

  void setYearSelection(DateTime dateTime) {
    selectedYear.value = dateTime;
    setMonthSelection(selectedMonth.value);
  }

  int getMonthIndex() {
    return (months.indexOf(selectedMonth.value));
  }

  String getTotalChartCount() {
    if (attendanceData.isEmpty) {
      return "No Data found!";
    }
    return attendanceChart.value?.workingDays.toString() ?? "0";
  }

  void animateToIndex(int index) {
    scrollController.animateTo(
      index * widthMonthWidget,
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
    update();
  }

  void setMonthSelection(String month) {
    totalDays.value = "NA";
    workingDays.value = "NA";
    selectedMonth.value = month;
    getAttendanceData(month, AppUtils.getYearFromDate(selectedYear.value));
    update();
  }

  bool isMonthSelected(String month) {
    var isSelected = false;
    if (month == selectedMonth.value) {
      isSelected = true;
    }
    return isSelected;
  }

  void getAttendanceData(String month, String year) async {
    try {
      DialogHelper.showLoading();
      AppUtils.printMessage("Current - Month$month  Year$year");
      Map<String, String> query = {'year': year, 'month': month};
      AttendanceRepository().getAttendanceInfo(query).then((value) {
        var js = jsonDecode(value);
        AttendanceModel attendanceRoot = AttendanceModel.fromJson(js);
        var attendanceDetail = attendanceRoot.data;
        attendanceChart.value = attendanceRoot.attendanceCount;
        totalDays.value =
            attendanceRoot.attendanceCount?.daysInMonth.toString() ?? "NA";

        workingDays.value =
            attendanceRoot.attendanceCount?.workingDays.toString() ?? "NA";
        presentCount.value =
            attendanceRoot.attendanceCount?.presentCount.toString() ?? "NA";
        absentCount.value =
            attendanceRoot.attendanceCount?.absentCount.toString() ?? "NA";
        leaveCount.value =
            attendanceRoot.attendanceCount?.leaveCount.toString() ?? "NA";
        halfDayCount.value =
            attendanceRoot.attendanceCount?.halfDayCount.toString() ?? "NA";
        lateCount.value =
            attendanceRoot.attendanceCount?.lateCount.toString() ?? "NA";
        totalHours.value =
            attendanceRoot.attendanceCount?.workedInMonth.toString() ?? "NA";
        maxHours.value =
            attendanceRoot.attendanceCount?.totalWorkHourInMonth.toString() ?? "NA";
        List<Attendance>? attendanceFiltered =
            attendanceDetail?.whereType<Attendance>().toList();
        if (attendanceFiltered != null) {
          attendanceData.value = attendanceFiltered;
        }
        if (attendanceData.isEmpty) {
          totalDays.value = "NA";
          workingDays.value = "NA";
          presentCount.value = "NA";
          absentCount.value = "NA";
          lateCount.value = "NA";
        }

        double present = 0;
        double absent = 0;
        double late = 0;
        double halfDay = 0;
        double leave = 0;
        if (attendanceRoot.attendanceCount != null) {
          present = attendanceRoot.attendanceCount?.presentCount?.toDouble() ??
              0.toDouble();
          absent = attendanceRoot.attendanceCount?.absentCount?.toDouble() ??
              0.toDouble();
          late = attendanceRoot.attendanceCount?.lateCount?.toDouble() ??
              0.toDouble();

          halfDay = attendanceRoot.attendanceCount?.halfDayCount?.toDouble() ??
              0.toDouble();

          leave = attendanceRoot.attendanceCount?.leaveCount?.toDouble() ??
              0.toDouble();
        }
        chartMap({"Present": present, "Absent": absent, "Late": late,"Half Day":halfDay,"Leave":leave});
        DialogHelper.dismissLoader();
        update();
        Future.delayed(const Duration(milliseconds: 500), () {
          DialogHelper.dismissLoader();
          animateToIndex(getMonthIndex());
        });
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
