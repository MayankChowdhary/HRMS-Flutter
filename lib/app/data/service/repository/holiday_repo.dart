import 'dart:convert';

import 'package:employee_attendance_flutter/app/core/utils/app_utils.dart';


import '../../api/api_client.dart';
import '../../api/api_path.dart';

class HolidayRepository {
  HolidayRepository();

  Future<dynamic> getHoliday() async {
    try {
      final response = await ApiClient.client.getApi(APIPath.kGetHolidays);
      AppUtils.printMessage(response.toString());
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }
}
