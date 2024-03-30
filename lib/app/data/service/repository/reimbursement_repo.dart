import 'dart:convert';

import 'package:employee_attendance_flutter/app/core/utils/app_utils.dart';
import 'package:employee_attendance_flutter/app/data/model/user_details_model.dart';
import 'package:flutter/foundation.dart';

import '../../../core/utils/storage_utils.dart';
import '../../api/api_client.dart';
import '../../api/api_path.dart';

class ReimbursementRepository {
  ReimbursementRepository();


  Future<dynamic> applyReimbursement(List<dynamic> imageFile, Map<String,dynamic> data) async {
    try {
      AppUtils.printMessage("Reimbursement updating..");
      final response =
      await ApiClient.client.uploadReimbursement(imageFile,APIPath.kPostReimbursement, data);
      AppUtils.printMessage("Reimbursement updated..$response");
      return response;
    } catch (e) {
      AppUtils.printMessage(e.toString());
      return Future.error(e);
    }
  }

  Future<dynamic> getReimbursement() async {
    try {
      final response = await ApiClient.client.getApi(APIPath.kGetReimbursement);
      AppUtils.printMessage(response.toString());
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }
}
