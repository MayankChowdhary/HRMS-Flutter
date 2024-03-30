import 'dart:convert';

import 'package:employee_attendance_flutter/app/core/utils/app_utils.dart';
import 'package:employee_attendance_flutter/app/data/model/user_details_model.dart';
import 'package:flutter/foundation.dart';

import '../../../core/utils/storage_utils.dart';
import '../../api/api_client.dart';
import '../../api/api_path.dart';

class AttendanceRepository {
  AttendanceRepository();


  Future<dynamic> getAttendanceInfo(Map<String,String> query) async {
    try {
      final response = await ApiClient.client.getQueryApi(APIPath.kGetAttendance,query: query);
      AppUtils.printMessage(response.toString());
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<dynamic> getAttendanceChart() async {
    try {
      final response = await ApiClient.client.getApi(APIPath.kGetAttendanceChart);
      AppUtils.printMessage(response.toString());
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }
}
