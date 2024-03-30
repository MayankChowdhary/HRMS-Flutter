import 'dart:convert';

import 'package:employee_attendance_flutter/app/core/utils/app_utils.dart';
import 'package:employee_attendance_flutter/app/data/model/user_details_model.dart';
import 'package:flutter/foundation.dart';

import '../../../core/utils/storage_utils.dart';
import '../../api/api_client.dart';
import '../../api/api_path.dart';

class HomeRepository {
  HomeRepository();

  Future<dynamic> createAttendance(String address, String coordinates) async {
    String email = StorageUtils.instance.getUsername();
    AppUtils.printMessage("Email: $email");
    try {
      Map<String, String> body = {
        "email": email,
        "current_address": address,
        "coordinate": coordinates
      };
      final response =
          await ApiClient.client.postAPi(APIPath.kAttendance, body: body);
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<dynamic> getUserInfo() async {
    try {
      final response = await ApiClient.client.getApi(APIPath.kGetUser);
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<dynamic> getOfficeLocation() async {
    try {
      final response =
          await ApiClient.client.getApi(APIPath.kGetOfficeLocation);
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<dynamic> getAttendanceStatus() async {
    try {
      final response =
          await ApiClient.client.getApi(APIPath.kGetAttendanceStatus);
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }
}
