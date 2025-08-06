import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CustomSnackbar {
  static void showSnackbar(BuildContext context, String title, String message, {Color? textColor}) {
    Get.snackbar(
      title,
      message,
      colorText: textColor ?? Colors.redAccent,
      borderRadius: 20.0,
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      duration: Duration(seconds: 3),
      animationDuration: Duration(milliseconds: 250),
      isDismissible: true,
      forwardAnimationCurve: Curves.easeIn,
      reverseAnimationCurve: Curves.easeOut,
    );
  }
}
