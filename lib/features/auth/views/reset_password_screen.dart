import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../routes/app_routes.dart';
import '../../../core/constants/app_assert_image.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/widget/app_bar/build_app_bar.dart';
import '../../../core/widget/buttons/app_button.dart';
import '../../../core/widget/text/app_text.dart';
import '../../../core/widget/text/text_field/AppTextFiled.dart';
class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final width = mediaQuery.size.width;

    return Scaffold(
      backgroundColor: AppColors.instance.appBackground,
      extendBodyBehindAppBar: false,
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.088,

        horizontal: height * 0.02,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: width * 0.06),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: height,
              ),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height * 0.02),
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(AppAssertImage.instance.searchLogo),
                    ),
                    // Title
                    Center(
                      child: AppText(
                        data: 'Set a new password',
                        fontSize: width * 0.08,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff18365D),
                      ),
                    ),
                    SizedBox(height: height * 0.015),

                    // Subtitle
                    Center(
                      child: AppText(
                        data:
                        'Create a new password. Ensure it differs from previous ones for security',
                        textAlign: TextAlign.center,
                        fontSize: width * 0.040,
                        height: 1.5,
                        maxLines: 3,
                        color: Color(0xff94A2B8),

                      ),
                    ),

                    SizedBox(height: height * 0.05),

                    // Password Fields
                    const AppTextField(
                      hintText: "Enter your password",
                      label: "Enter new password",

                    ),
                    SizedBox(height: height * 0.02),
                    const AppTextField(
                      hintText: "Confirm New Password",
                      label: "Re-type password",
                    ),

                    SizedBox(height: height * 0.03),

                    // Reset Button
                    AppButton(
                      buttonText: "Reset Password",
                      onPressed: () => Get.toNamed(AppRoutes.login),
                      borderRadius: 10,
                      buttonHeight: 48,
                    ),

                    SizedBox(height: height * 0.03),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
