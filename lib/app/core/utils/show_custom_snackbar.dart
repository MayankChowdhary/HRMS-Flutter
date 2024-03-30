import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/big_text_widget.dart';

void showCustomSnackBar(String message,
    {bool isError = true, String title = "Error", int duration = 4}) {
  if(Get.isSnackbarOpen){
    Get.closeAllSnackbars();
  }

  Get.snackbar(title, message, duration:  Duration(seconds: duration),
      titleText: BigText(
        text: title,
        color: Colors.white,
      ),
      messageText: Text(
        message,
        style:  const TextStyle(color: Colors.white, fontSize: 16),
      ),
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: isError?Colors.red:Colors.green, );

}
