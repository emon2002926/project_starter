import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';

class OtpVerificationController extends GetxController {
  final otpControllers = List.generate(6, (_) => TextEditingController());
  final focusNodes = List.generate(6, (_) => FocusNode());

  String get otpCode =>
      otpControllers.map((controller) => controller.text).join();

  void onOtpChanged(String value, int index) {
    if (value.length == 1 && index < 5) {
      focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      focusNodes[index - 1].requestFocus();
    }
  }

  void verifyCode() {
    if (otpCode.length == 6) {
      Get.snackbar(
        "Success",
        "Code verified!",
        backgroundColor: const Color(0xFF4CAF50),
        colorText: Colors.white,
      );
      Get.toNamed(AppRoutes.resetPassword);

    } else {
      Get.snackbar(
        "Error",
        "Please enter the full 6-digit code.",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void resendOtp() {
    Get.snackbar(
      "OTP Sent",
      "OTP resent to your email.",
      backgroundColor: Colors.blueAccent,
      colorText: Colors.white,
    );
  }

  @override
  void onClose() {
    for (var controller in otpControllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    super.onClose();
  }
}