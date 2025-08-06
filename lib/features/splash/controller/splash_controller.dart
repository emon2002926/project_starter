import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../routes/app_routes.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'dart:async';

class SplashController extends GetxController {
  final box = GetStorage();  // GetStorage instance

  @override
  void onInit() {
    super.onInit();
    _startTimer();
  }

  // Start the timer to simulate splash screen delay
  void _startTimer() {
    Timer(const Duration(seconds: 3), () {
      // Check if the user is logged in by checking for the access token
      String? accessToken = box.read('token');
      //TODO : CHECK IF USER IS LOGGED IN OR HAVE ACCESS TOKEN
      // print("access $accessToken");

      if (accessToken != null) {
        // If access token exists, navigate to the home screen
        Get.offNamed(AppRoutes.home);
      } else {
        // If no access token, navigate to the sign_in screen
        Get.offNamed(AppRoutes.login);
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
  }
}