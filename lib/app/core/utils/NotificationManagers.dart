import 'package:employee_attendance_flutter/app/core/utils/app_utils.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../routes/routes.dart';

class NotificationManagers {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  static const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'com.tys.notification', // id
    'TYS Attendance Notifications', // title
    description: 'This channel is used for Attendance related notifications.',
    // description
    importance: Importance.max,
  );

   static Future onSelectNotification(NotificationResponse notificationResponse) async {
    AppUtils.printMessage("PayloadPrint${notificationResponse.payload}");
    return   Get.toNamed(AppUtils.getRoutedAction(notificationResponse.payload.toString()));
  }

  static Future<void> setup() async {
    const androidInitializationSetting =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosInitializationSetting = DarwinInitializationSettings();
    const initSettings = InitializationSettings(
        android: androidInitializationSetting, iOS: iosInitializationSetting);
    await flutterLocalNotificationsPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) async {
        onSelectNotification(notificationResponse);
      },
      onDidReceiveBackgroundNotificationResponse:
          (NotificationResponse notificationResponse) async {
        onSelectNotification(notificationResponse);
      },
    );
  }

  static DarwinNotificationDetails iosNotificatonDetail = DarwinNotificationDetails();
  static AndroidNotificationDetails androidNotificatonDetail = AndroidNotificationDetails(
    channel.id,
    channel.name,
    channelDescription: channel.description,
    color: Colors.blue,
    // TODO add a proper drawable resource to android, for now using
    //      one that already exists in example app.
    icon: "@mipmap/ic_launcher",
  );
  static NotificationDetails notificationDetails = NotificationDetails(
    iOS: iosNotificatonDetail,
    android: androidNotificatonDetail,
  );

  static void showNotification(RemoteMessage message){
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    AppUtils.printMessage("Push Data${message.data}");
    AppUtils.printMessage("Push Notification${message.notification?.android?.imageUrl}");
    if (notification != null && android != null) {
      flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          notificationDetails,
          payload: message.data['label'] );
    }
  }

}