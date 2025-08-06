import 'package:flutter/material.dart';
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
      backgroundColor: AppColors.instance.appBackground,
      extendBodyBehindAppBar: true,
      appBar: BuildAppBar(
        showBackButton: true,
        iconColor: AppColors.instance.white50,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: width * 0.06),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: height * 0.9),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.05),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: height * 0.01),

                        // Title
                        AppText(
                          data: 'Forgot Password?',
                          fontSize: width * 0.055,
                          fontWeight: FontWeight.bold,
                          color: AppColors.instance.white50,
                        ),

                        SizedBox(height: height * 0.015),

                        // Subtitle
                        SizedBox(
                          width: double.infinity,
                          child: AppText(
                            data:
                            'Enter your email and we will send you a\nverification code',
                            textAlign: TextAlign.center,
                            fontSize: width * 0.035,
                            color: AppColors.instance.white50,
                            fontWeight: FontWeight.normal,
                            height: 1.4,
                          ),
                        ),

                        SizedBox(height: height * 0.05),

                        // Email Field
                        AppTextField(
                          controller: controller.emailController,
                          label: "Email",
                          hintText: 'Enter your email',
                        ),

                        SizedBox(height: height * 0.05),

                        // Send Code Button
                        Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: AppButton(
                            buttonText: "Send Code",
                            onPressed: () => controller.sendVerificationCode(context),
                            borderRadius: 25,
                            buttonHeight: 48,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}