import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/widget/app_bar/build_app_bar.dart';
import '../../../core/widget/buttons/app_button.dart';
import '../../../core/widget/text/app_text.dart';
import '../view_models/otp_verification_controller.dart';

class OtpVerificationPage extends StatelessWidget {
  const OtpVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OtpVerificationController());
    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final width = mediaQuery.size.width;

    return Scaffold(

      backgroundColor: AppColors.instance.white50,
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  SizedBox(height: height * 0.05),

                  // Title
                  AppText(
                    data: 'Check your email ',
                    fontSize: width * 0.08,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff18365D),

                  ),
                  SizedBox(height: height * 0.015),

                  // Subtitle
                  AppText(
                    data:
                    'We sent a reset link to astro@gmail.com\nPlease enter the 6 digit code.',
                    fontSize: width * 0.040,
                    textAlign: TextAlign.center,
                    height: 1.4,
                    fontWeight: FontWeight.normal,
                    color: Color(0xff94A2B8),

                  ),
                  SizedBox(height: height * 0.05),

                  // OTP Fields (6 OTP TextFields)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(6, (index) {
                      return SizedBox(
                        width: width * 0.11,
                        child: TextField(
                          controller: controller.otpControllers[index],
                          focusNode: controller.focusNodes[index],
                          onChanged: (value) => controller.onOtpChanged(value, index),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          maxLength: 1,
                          decoration: InputDecoration(
                            counterText: '',
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.all(width * 0.02),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Color(0xffE2E8F0)
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: AppColors.instance.dark400,
                                width: 2,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.red),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.red, width: 2),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: height * 0.015),

                  // Resend Link

                  SizedBox(height: height * 0.03),

                  // Verify Button
                  AppButton(
                    buttonText: "Verify Code",
                    onPressed: controller.verifyCode,
                    borderRadius: 10,
                    buttonHeight: 48,
                  ),
                  SizedBox(height: height * 0.02),

                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: controller.resendOtp,
                      child: AppText(
                        data: 'Resend OTP',
                        fontSize: width * 0.035,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
