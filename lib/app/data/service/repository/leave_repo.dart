import 'dart:convert';

import 'package:employee_attendance_flutter/app/core/utils/app_utils.dart';

import '../../api/api_client.dart';
import '../../api/api_path.dart';

class LeaveRepository {
  LeaveRepository();

  Future<dynamic> getLeaveInfo() async {
    try {
      final response = await ApiClient.client.getApi(APIPath.kGetLeaveStatus);
      AppUtils.printMessage(response.toString());
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<dynamic> applyLeave(Map<String, dynamic> body) async {
    try {
      final response =
      await ApiClient.client.postAPi(APIPath.kApplyLeave, body: body);
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<dynamic> getLeaves() async {
    try {
      final response = await ApiClient.client.getApi(APIPath.kGetLeaves);
      AppUtils.printMessage(response.toString());
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }
}
