import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_starter/core/constants/app_constant.dart';
import '../../../core/constants/app_assert_image.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/widget/app_bar/build_app_bar.dart';
import '../../../core/widget/buttons/app_button.dart';
import '../../../core/widget/buttons/social_login_buttons.dart';
import '../../../core/widget/text/app_text.dart';
import '../../../core/widget/text/text_field/AppTextFiled.dart';
import '../../../routes/app_routes.dart';
import '../view_models/login_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final controller = Get.put(LoginController()); // Binding the controller
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.instance.appBackground,
      extendBodyBehindAppBar: false,
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.08,
                  horizontal: MediaQuery.of(context).size.height * 0.02,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.instance.white50,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height,
                      ),
                      child: IntrinsicHeight(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: AppText(data: "Welcome to Trade Pilot", fontSize: 22,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.06,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: AppText(data: "Sign up to get started", fontSize: 16,),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            // const SizedBox(height: 8),
                            AppTextField(
                              hintText: "Enter your user name here",
                              controller: controller.usernameController,
                              focusNode: controller.usernameFocusNode,
                            ),
                            const SizedBox(height: 16),
                            AppTextField(
                              hintText: "Enter your password",
                              controller: controller.passwordController,
                              focusNode: controller.passwordFocusNode,
                              obscureText: true,
                              suffixIcon: Icons.visibility_off,
                            ),
                            const SizedBox(height: 16),
                            Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                onTap: controller.navigateToForgetPassword,
                                child: AppText(data: "Forget Password?", fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),

                            AppButton(
                              buttonText: "Login",
                              onPressed: controller.login, // Trigger login method
                              borderRadius: 25,
                              buttonHeight: 48,
                              elevation: 4,
                            ),
                            const SizedBox(height: 24),
                            const Row(
                              children: [
                                Expanded(child: Divider(color: Colors.grey)),
                                Padding(padding: EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text("or", style: TextStyle(color: Colors.grey)),
                                ),
                                Expanded(child: Divider(color: Colors.grey)),
                              ],
                            ),
                            const SizedBox(height: 24),
                            SocialLoginButtons(title: "Continue with Google", onPressed: () {}, iconPath: AppAssertImage.instance.googleLogo),
                            const SizedBox(height: 16),
                            SocialLoginButtons(title: "Continue with Apple", onPressed: () {}, iconPath: AppAssertImage.instance.appleLogo),
                            const SizedBox(height: 24),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const AppText(
                                  data: "Don't have an account? ",
                                  fontSize: 14,
                                ),
                                GestureDetector(
                                  onTap: () => Get.toNamed(AppRoutes.register),
                                  child: const AppText(
                                    data: "Register Now",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}