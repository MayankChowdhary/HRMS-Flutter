import 'dart:convert';

import 'package:employee_attendance_flutter/app/core/utils/app_utils.dart';
import 'package:employee_attendance_flutter/app/data/model/user_details_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

import '../../../core/utils/storage_utils.dart';
import '../../api/api_client.dart';
import '../../api/api_path.dart';

class NotificationRepository {
  NotificationRepository();

  Future<dynamic> postDeviceToken(String? userId, String? token,
      String deviceOS, String deviceName, String oSVersion) async {
    try {
      if (userId != null && token != null) {
        Map<String, String> body = {
          "userid": userId,
          "device_token": token,
          "device_os": deviceOS,
          "device_name": deviceName,
          "os_version": oSVersion
        };
        final response =
            await ApiClient.client.postAPi(APIPath.kPostToken, body: body);
        return response;
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<String?> getFirebaseToken() async {
    try {
      final messaging = FirebaseMessaging.instance;
      String? token = await messaging.getToken();
      return token;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<dynamic> getNotifications() async {
    try {
      final response = await ApiClient.client.getApi(APIPath.kGetNotifications);
      AppUtils.printMessage(response.toString());
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }
}
