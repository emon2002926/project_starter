import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:project_starter/core/widget/text/app_text.dart';
import '../../core/constants/app_assert_image.dart';
import 'controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller using Get.put() or Get.lazyPut() in main.dart for better optimization
    final controller = Get.find<SplashController>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: AppText(
            data: 'Deal Detector',
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
          // child: Image.asset(
          //   AppAssertImage.instance.splashImage, // Your image path
          //   width: MediaQuery.of(context).size.width * 0.75,
          //   fit: BoxFit.contain,
          // ),
        ),
      ),
    );
  }
}
