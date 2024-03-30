import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';

import '../../core/utils/storage_utils.dart';
import 'app_exception.dart';


class ApiClient {
  ApiClient._();

  static final ApiClient _client = ApiClient._();

  static ApiClient get client => _client;

  Map<String,String> get _headers => {
    "Accept": "application/json",
    "Content-Type": "application/json",
    if(StorageUtils.instance.isLoggedIn()) "Authorization": "Bearer ${StorageUtils.instance.getToken()}",
    "Cache-Control": "no-cache",
    if(!StorageUtils.instance.isLoggedIn())"authkey":'xqibzknznwb29de15s44'
  };

  Future<dynamic> getApi(String url) async {
    var responseJson;
    try {
      final response = await get(Uri.parse(url), headers: _headers);
      responseJson = _returnResponse(response);
    } catch (e) {
      debugPrint(e.toString());
      return Future.error(e);
    }
    return responseJson;
  }

  Future<dynamic> getQueryApi(String url,{required Map<String,String> query}) async {
    var responseJson;
    try {
      Uri uri = Uri(queryParameters: query,path: url);

      String finalUrl  = Uri.decodeComponent(uri.toString());

      final response = await get(Uri.parse(finalUrl), headers: _headers);

      responseJson = _returnResponse(response);
    } catch (e) {
      debugPrint(e.toString());
      return Future.error(e);
    }
    return responseJson;
  }

  Future<dynamic> postAPi(String url,{required Map<String,dynamic> body}) async {
    var responseJson;
    try {

      final response = await post(Uri.parse(url),body: jsonEncode(body), headers: _headers);

      responseJson = _returnResponse(response);
    } catch (e) {
      debugPrint(e.toString());
      return Future.error(e);
    }
    return responseJson;
  }

  Future<dynamic> putApi(String url,{required Map<String,String> body}) async {
    var responseJson;
    try {

      final response = await put(Uri.parse(url),body: jsonEncode(body), headers: _headers);

      responseJson = _returnResponse(response);
    } catch (e) {
      debugPrint(e.toString());
      return Future.error(e);
    }
    return responseJson;
  }

  Future<dynamic> deleteApi(String url,{Map<String,String>? body}) async {
    var responseJson;
    try {

      final response = await delete(Uri.parse(url),body:body==null?null:jsonEncode(body), headers: _headers);

      responseJson = _returnResponse(response);
    } catch (e) {
      debugPrint(e.toString());
      return Future.error(e);
    }
    return responseJson;
  }

  Future<dynamic> uploadPictureAPI(File imageFile, String url, String id) async {
    try {
      var request = MultipartRequest("POST", Uri.parse(url));
      request.headers.addAll(_headers);
      request.fields["userid"] = id;
      request.fields["_method"] = "PUT";
      //create multipart using filepath, string or bytes
      var pic = await MultipartFile.fromPath('src',  imageFile.path, contentType:  MediaType('image', 'jpeg'));
     // var pic = await MultipartFile.fromPath("src", imageFile.path);
      //add multipart to request
      request.files.add(pic);
      debugPrint("Upload request :$request");
      var response = await request.send();
      //Get the response from the server
      var responseData = await response.stream.toBytes();
      var responseString = String.fromCharCodes(responseData);
      debugPrint(responseString);
    } catch (e) {
      debugPrint(e.toString());
      return Future.error(e);
    }
  }

  Future<dynamic> uploadReimbursement(
      List<dynamic> imageFile, String url, Map<String, dynamic> data) async {
    try {
      debugPrint("Upload request : Multipart data adding");
      var request = MultipartRequest("POST", Uri.parse(url));
      request.headers.addAll(_headers);
      request.fields["userid"] = data['userid'].toString();
      request.fields["expense_date"] = data['expense_date'].toString();
      request.fields["total_amt"] = data['total_amt'].toString();
      request.fields["email"] = data['email'.toString()];
      request.fields["upi_id"] = data['upi_id'].toString();
      debugPrint("Upload request : String data added");
      //create multipart using filepath, string or bytes
      List<String> descItem = getListString(data['descItem']);
      List<String> rateUnit = getListString(data['rateUnit']);
      List<String> quantity = getListString(data['quantity']);
      List<String> total_sum = getListString(data['total_sum']);

      for (int i = 0; i < total_sum.length; i++) {
        request.files.add(MultipartFile.fromString('descItem[]', descItem[i]));
        request.files.add(MultipartFile.fromString('rateUnit[]', rateUnit[i]));
        request.files.add(MultipartFile.fromString('quantity[]', quantity[i]));
        request.files
            .add(MultipartFile.fromString('total_sum[]', total_sum[i]));
      }
      debugPrint("Upload request : List data added");

      for (String path in imageFile) {
        var pic = await MultipartFile.fromPath('images', path,
            contentType: MediaType('image', 'jpeg'));
        request.files.add(pic);
      }
      // var pic = await MultipartFile.fromPath("src", imageFile.path);
      //add multipart to request
      debugPrint("Upload request :$request");
      var response = await request.send();
      //Get the response from the server
      var responseData = await response.stream.toBytes();
      var responseString = String.fromCharCodes(responseData);
      debugPrint("Printing response");
      debugPrint(responseString);
    } catch (e) {
      debugPrint(e.toString());
      return Future.error(e);
    }
  }

  List<String> getListString(List<dynamic> data) {
    return (data).map((item) => item as String).toList();
  }

  ///Responsible for returning the response from server and handle the exception
  dynamic _returnResponse(Response response) {
    log("URL ==>  ${response.request!.url.toString()}");
    log("Response ==>  ${response.body.toString()}");
    switch (response.statusCode) {
      case 200:
      case 201:
        return response.body;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
        throw UnAuthorisedException(response.body.toString());
      case 403:
        throw ForbiddenException(response.body.toString());
      case 404:
        throw InvalidInputException(message: response.body.toString());
      case 422:
        throw UnProcessableEntity(response.body.toString());
      case 500:
      default:
        throw FetchDataException(message: response.body.toString());
    }
  }
}
