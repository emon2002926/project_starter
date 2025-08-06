import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../routes/app_routes.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/widget/app_bar/build_app_bar.dart';
import '../../../core/widget/buttons/app_button.dart';
import '../../../core/widget/text/app_text.dart';
import '../../../core/widget/text/text_field/AppTextFiled.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final width = mediaQuery.size.width;

    return Scaffold(
      backgroundColor: AppColors.instance.appBackground,
      extendBodyBehindAppBar: true,
      appBar: BuildAppBar(
        title: "Reset Password",
        iconColor: AppColors.instance.white50,
        titleColor: AppColors.instance.white50,
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
                  SizedBox(height: height * 0.02),

                  // Title
                  Center(
                    child: AppText(
                      data: 'Set a new password',
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.bold,
                      color: AppColors.instance.white50,
                    ),
                  ),

                  SizedBox(height: height * 0.015),

                  // Subtitle
                  Center(
                    child: AppText(
                      data:
                      'Create a new password. Ensure it differs from previous ones for security',
                      textAlign: TextAlign.center,
                      fontSize: width * 0.035,
                      color: AppColors.instance.white50,
                      height: 1.5,
                      maxLines: 3,
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
                    label: "Confirm New Password",
                  ),

                   SizedBox(height: height * 0.03,),

                  // Reset Button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: AppButton(
                      buttonText: "Reset Password",
                      onPressed: () => Get.toNamed(AppRoutes.login),
                      borderRadius: 25,
                      buttonHeight: 48,
                    ),
                  ),

                  SizedBox(height: height * 0.03),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
