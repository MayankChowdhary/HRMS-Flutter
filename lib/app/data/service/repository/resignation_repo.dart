import 'dart:convert';

import 'package:employee_attendance_flutter/app/core/utils/app_utils.dart';
import 'package:employee_attendance_flutter/app/data/model/user_details_model.dart';
import 'package:flutter/foundation.dart';

import '../../../core/utils/storage_utils.dart';
import '../../api/api_client.dart';
import '../../api/api_path.dart';

class ResignationRepository {
  ResignationRepository();

  Future<dynamic> applyResignation(Map<String,String> body) async {
    try {
      AppUtils.printMessage(body.toString());
      final response = await ApiClient.client.postAPi(APIPath.kPostResignation,body: body);
      AppUtils.printMessage(response.toString());
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<dynamic> getResignation() async {
    try {
      final response = await ApiClient.client.getApi(APIPath.kGetResignation);
      AppUtils.printMessage(response.toString());
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }

}
