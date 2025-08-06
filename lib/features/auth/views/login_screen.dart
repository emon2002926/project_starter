import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.instance.appBackground,
      appBar: BuildAppBar(showBackButton: false,),
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.10),
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height,
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 12),
                        Align(
                          alignment: Alignment.center,
                          child: AppText(data: "Welcome Back", color: AppColors.instance.white50, fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                        const SizedBox(height: 8),

                        // Username Input using TextEditingController
                        AppTextField(
                          hintText: "Enter your user name here",
                          label: "User Name",
                          controller: controller.usernameController,
                          focusNode: controller.usernameFocusNode,
                        ),
                        const SizedBox(height: 16),
                        const SizedBox(height: 8),

                        // Password Input using TextEditingController
                        AppTextField(
                          hintText: "Enter your password",
                          label: "Password",
                          controller: controller.passwordController,
                          focusNode: controller.passwordFocusNode,
                          obscureText: true,
                        ),
                        const SizedBox(height: 16),

                        // Forget password
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: controller.navigateToForgetPassword,
                            child: AppText(data: "Forget Password?", fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Login Button
                        AppButton(
                          buttonText: "Login",
                          onPressed: controller.login, // Trigger login method
                          borderRadius: 25,
                          buttonHeight: 48,
                        ),
                        const SizedBox(height: 24),

                        // Divider with text
                        const Row(
                          children: [
                            Expanded(child: Divider(color: Colors.white)),
                            Padding(padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text("or", style: TextStyle(color: Colors.white)),
                            ),
                            Expanded(child: Divider(color: Colors.white)),
                          ],
                        ),
                        const SizedBox(height: 24),

                        // Social Login Buttons
                        SocialLoginButtons(title: "Continue with Google", onPressed: () {}, iconPath: AppAssertImage.instance.googleLogo),
                        const SizedBox(height: 16),
                        SocialLoginButtons(title: "Continue with Apple", onPressed: () {}, iconPath: AppAssertImage.instance.appleLogo),
                        const SizedBox(height: 24),

                        // Register Link
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have an account? ",
                              style: TextStyle(color: Colors.white, fontSize: 14),
                            ),
                            GestureDetector(
                              onTap: () => Get.toNamed(AppRoutes.register),
                              child: const Text(
                                "Register Now",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),
                      ],
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