import 'package:flutter/material.dart';
import '../../../core/constants/app_assert_image.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/widget/app_bar/build_app_bar.dart';
import '../../../core/widget/buttons/app_button.dart';
import '../../../core/widget/text/app_text.dart';
import '../../../core/widget/text/text_field/AppTextFiled.dart';
import 'package:get/get.dart';
import '../view_models/verify_cmail_controller.dart';

class VerifyEmailScreen extends StatelessWidget {
  VerifyEmailScreen({super.key});
  final VerifyEmailController controller = Get.put(VerifyEmailController());
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final width = mediaQuery.size.width;

    return Scaffold(
      backgroundColor:Colors.white,
      extendBodyBehindAppBar: true,

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: height * 0.14,
            horizontal: width * 0.06,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.05),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: height * 0.01),
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset(AppAssertImage.instance.searchLogo),
                      ),
                      AppText(
                        data: 'Forgot Password?',
                        fontSize: MediaQuery.of(context).size.width * 0.08, // Dynamically set font size based on screen width
                        fontWeight: FontWeight.bold,
                        color: Color(0xff18365D),

                      ),

                      SizedBox(height: height * 0.009),

                      // Subtitle
                      SizedBox(
                        width: double.infinity,
                        child: AppText(
                          data:
                          'Enter your email and we will send you a\nverification code',
                          textAlign: TextAlign.center,
                          fontSize: width * 0.040,
                          fontWeight: FontWeight.normal,
                          height: 1.4,
                          color: Color(0xff94A2B8),

                        ),
                      ),

                      SizedBox(height: height * 0.05),

                      // Email Field
                      AppTextField(
                        controller: controller.emailController,
                        label: "Email",
                        hintText: 'Enter your email',
                        labelColor: AppColors.instance.labelTextColor
                      ),

                      SizedBox(height: height * 0.03),

                      // Send Code Button
                      AppButton(
                        buttonText: "Send OTP",
                        onPressed: () =>
                            controller.sendVerificationCode(context),
                        borderRadius: 10,
                        buttonHeight: 44,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
