
import 'dart:convert';
import 'dart:io';

import 'package:employee_attendance_flutter/app/core/utils/app_utils.dart';

import '../../api/api_client.dart';
import '../../api/api_path.dart';

class ProfileRepository {
  ProfileRepository();

  Future<dynamic> updateProfile(Map<String, String> body, String url) async {
    try {
      print(body);
      final response =
          await ApiClient.client.putApi(url, body: body);
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }


  Future<dynamic> updateProfilePicture(File imageFile, String id) async {
    try {
      AppUtils.printMessage("Profile picture updating..");
      print("Size FIle: ${await AppUtils.getFileSize(imageFile)}");
      final response =
      await ApiClient.client.uploadPictureAPI(imageFile,APIPath.kPostProfilePicture, id);
      AppUtils.printMessage("Profile picture updated..$response");
      return response;
    } catch (e) {
      AppUtils.printMessage(e.toString());
      return Future.error(e);
    }
  }
}
