import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:math' as mth;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../routes/routes.dart';

class AppUtils {
  AppUtils._();

  static printMessage(String message) {
    if (kDebugMode) {
      log(message);
    }
  }

  static int calculateDifference(DateTime now) {
    DateTime date = DateTime.now();
    return DateTime(date.year, date.month, date.day)
        .difference(DateTime(now.year, now.month, now.day))
        .inDays;
  }

  static String getYearMonthFromDays(int days) {
    int noOfDays = days;

    int year = noOfDays ~/ 365;
    noOfDays = noOfDays % 365;

    int month = noOfDays ~/ 30;
    noOfDays = noOfDays % 30;

    int week = noOfDays ~/ 7;
    noOfDays = noOfDays % 7;

    String result = "$year Year $month Months ";
        //"$week Weeks";
    return result;
  }

  static isFirstBeforeOrEqualThanSecond(DateTime  date1, DateTime date2) {
    int diff = DateTime(date1.year, date1.month, date1.day)
        .difference(DateTime(date2.year, date2.month, date2.day))
        .inDays;
    AppUtils.printMessage("isFirstBeforeThanSecond: $diff");
    if(diff<=0){
      return true;
    }else{
      return false;
    }

  }

  static DateTime parseDateTimeFromString(String rawDate){
    return DateFormat("yyyy-MM-dd").parse(rawDate);
  }

  static String getFormattedDateTime(String dateTime) {
    if (dateTime.isEmpty) {
      return "00:00";
    }
    DateTime timeDate = DateTime.parse(dateTime);
    String hour = timeDate.hour.toString();
    if (hour.length < 2) {
      hour = "0$hour";
    }
    String min = timeDate.minute.toString();
    if (min.length < 2) {
      min = "0$min";
    }
    return ("$hour:$min");
  }

  static String getFormattedTime(String time) {
    if (time.isEmpty) {
      return "00:00";
    }
    try {
      String timeFormatted =
      DateFormat.Hm().format(DateFormat("HH:mm:ss").parse(time));
      return (timeFormatted);
    } catch (e) {
      return "00:00";
    }
  }

  static String getDateAndDay() {
    DateTime date = DateTime.now();
    dynamic dayData =
        '{ "1" : "Monday", "2" : "Tuesday", "3" : "Wednesday", "4" : "Thursday", "5" : "Friday", "6" : "Saturday", "7" : "Sunday" }';

    dynamic monthData =
        '{ "1" : "Jan", "2" : "Feb", "3" : "Mar", "4" : "Apr", "5" : "May", "6" : "June", "7" : "Jul", "8" : "Aug", "9" : "Sep", "10" : "Oct", "11" : "Nov", "12" : "Dec" }';

    return json.decode(dayData)['${date.weekday}'] +
        ", " +
        json.decode(monthData)['${date.month}'] +
        " " +
        date.day.toString();
    // date.year.toString();
  }

  static String getDateNumber(String date) {
    if (date.isEmpty) {
      return "00";
    }
    DateTime target = DateTime.parse(date);
    return target.day.toString();
    // date.year.toString();
  }

  static String getDateDay(String date) {
    if (date.isEmpty) {
      return "Nil";
    }
    DateTime target = DateTime.parse(date);
    dynamic dayData =
        '{ "1" : "Mon", "2" : "Tue", "3" : "Wed", "4" : "Thu", "5" : "Fri", "6" : "Sat", "7" : "Sun" }';

    return json.decode(dayData)['${target.weekday}'];
    // date.year.toString();
  }

  static String getStandardFormat(String date) {
    if (date.isEmpty) {
      return "NA";
    }
    DateTime target = DateTime.parse(date);
    dynamic monthData =
        '{  "1": "January", "2": "February","3":  "March", "4":"April","5":"May","6":"June","7":"July","8": "August","9":"September","10":"October","11":"November","12":"December"}';

    String day = target.day.toString();
    String year =  target.year.toString();
    String months =  json.decode(monthData)['${target.month}'];
    return  "$day $months $year";
  }

  static getReversedDate(String date){
    final splitted = date.split('/');
    return '${splitted[2]}-${splitted[1]}-${splitted[0]}';
  }

  static String getCurrentMonth() {
    DateTime date = DateTime.now();
    dynamic monthData =
        '{  "1": "January", "2": "February","3":  "March", "4":"April","5":"May","6":"June","7":"July","8": "August","9":"September","10":"October","11":"November","12":"December"}';

    return json.decode(monthData)['${date.month}'];
  }

  static String getCurrentYear() {
    DateTime date = DateTime.now();
    return date.year.toString();
  }


  static String getCurrentDate(){
    DateTime today = DateTime.now();
    return "${today.day}-${today.month}-${today.year}";
  }

  static String getCurrentDateInverse(){
    DateTime today = DateTime.now();
    return "${today.year}-${today.month}-${today.day}";
  }

  static String getAddedDays(int numberOfDays){
    DateTime today = DateTime.now();
    final resignationDateFromNow = today.add(Duration(days: numberOfDays));
    return "${resignationDateFromNow.year}-${resignationDateFromNow.month}-${resignationDateFromNow.day}";
  }

  static String getYearFromDate(DateTime? dateTime) {
    dateTime ??= DateTime.now();
    return dateTime.year.toString();
  }

  static bool isTimePassed(String time) {
    final now = DateTime.now();
    final todayDate = "${now.year}-${now.month}-${now.day} $time";
    DateTime expirationDate = DateFormat("yyyy-MM-dd HH:mm:ss").parse(
        todayDate);
    return expirationDate.isBefore(now);
  }

  static Future<CroppedFile?> cropImage(BuildContext context,
      String value) async {
    CroppedFile? croppedImage = await ImageCropper().cropImage(
      sourcePath: value,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Crop Image',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: true),
        IOSUiSettings(
          title: 'Crop Image',
        ),
        WebUiSettings(
          context: context,
        ),
      ],
    );
    return croppedImage;
  }

  static getFileSize(File file) async {
    int decimals = 1;
    int bytes = await file.length();
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (mth.log(bytes) / mth.log(1024)).floor();
    return '${(bytes / mth.pow(1024, i)).toStringAsFixed(
        decimals)} ${suffixes[i]}';
  }

  static getEditIcon(String key){
    switch(key){
      case 'Designation':
        return Icons.chair_outlined;
      case  'Experience':
        return  Icons.auto_graph_outlined;
      case  'Skills':
        return  Icons.menu_book_outlined;
      case  'Bio':
        return  Icons.featured_play_list_outlined;
      case  'Address1':
        return  Icons.location_on_outlined;
      case  'Address2':
        return  Icons.location_on_outlined;
      case  'Zipcode':
        return  Icons.location_on_outlined;
      case  'City':
        return  Icons.location_on_outlined;
      case  'State':
        return  Icons.location_on_outlined;
      case  'Country':
        return  Icons.location_on_outlined;
        case  'Blood Group':
        return  Icons.bloodtype_outlined;
      case  'Father Name':
        return  Icons.elderly_outlined;
      case  'Mother Name':
        return  Icons.elderly_woman_outlined;
      case  'Personal Email':
        return  Icons.email_outlined;
      case  'Alternate Contact':
        return  Icons.phone_android_outlined;
      case  'Family Address':
        return  Icons.home_outlined;
      case  'Bank Name':
        return  Icons.account_balance_outlined;
      case  'Account No.':
        return  Icons.money;
      case  'IFSC Code':
        return  Icons.pin;
      case  'Branch Name':
        return  Icons.location_city_outlined;
      case  'Name as per Bank':
        return  Icons.verified_user_outlined;
      case  'Pan No.':
        return  Icons.credit_card_outlined;
      case  'AADHAR No.':
        return  Icons.perm_identity_outlined;
      default:
        return  Icons.star_purple500_rounded;

    }
  }

  static String getRoutedAction(String action){
    switch(action){
      //Holiday
      case 'HL':return Routes.splashPage;
      //Leave
      case 'LV':return Routes.leaveStatusPage;
      //Regularization
      case 'RG':return Routes.regularizationDisplay;
      //Resignation
      case 'RN':return Routes.resinStatusPage;
      //Reimbursement
      case 'RM':return Routes.reimburseStatusPage;
      //Happy Birthday
      case 'HB':return Routes.splashPage;
      //General
      case 'GN':return Routes.splashPage;
      default:return Routes.splashPage;
    }
  }

}
