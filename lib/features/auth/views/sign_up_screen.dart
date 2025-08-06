import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/widget/app_bar/build_app_bar.dart';
import '../../../core/widget/buttons/app_button.dart';
import '../../../core/widget/text/app_text.dart';
import '../../../core/widget/text/text_field/AppTextFiled.dart';
import '../view_models/SignUpController.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SingUpController signUpController = Get.put(SingUpController());

    return Scaffold(
      backgroundColor: AppColors.instance.appBackground,
      extendBodyBehindAppBar: true,
      appBar: BuildAppBar(
        title: "Sign Up",
        iconColor: AppColors.instance.white50,
        titleColor: AppColors.instance.white50,
      ),
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(height: 12),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                    AppTextField(
                      controller: signUpController.nameController,
                      hintText: "Full Name",
                      label: "Full Name",
                      focusNode: signUpController.nameFocusNode,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                    AppTextField(
                      controller: signUpController.emailController,
                      hintText: "Email",
                      label: "Email",
                      focusNode: signUpController.emailFocusNode,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                    AppTextField(
                      controller: signUpController.phoneController,
                      label: "Phone Number",
                      hintText: "Phone Number",
                      focusNode: signUpController.phoneFocusNode,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                    AppTextField(
                      controller: signUpController.passwordController,
                      hintText: "Password",
                      suffixIcon: Icons.visibility_off,
                      label: "Password",
                      focusNode: signUpController.passwordFocusNode,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                    AppTextField(
                      controller: signUpController.confirmPasswordController,
                      hintText: "Confirm password",
                      suffixIcon: Icons.visibility_off,
                      label: "Confirm password",
                      focusNode: signUpController.confirmPasswordFocusNode,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.035),
                    AppButton(
                      buttonText: "Register",
                      onPressed: signUpController.signUp,
                      borderRadius: 25,
                      buttonHeight: 48,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.020),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(data: "Already have an account? ", fontSize: 14, color: AppColors.instance.white50),
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: AppText(data: "Sign In", color: AppColors.instance.white50, fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
