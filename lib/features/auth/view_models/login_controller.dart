import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import '../../../core/widget/snackbar/custom_snackbar.dart';
import '../../../routes/app_routes.dart';
import '../data/sign_in/sign_in_data_source.dart';
import '../data/sign_in/sign_in_repository.dart';
import '../models/sign_in/sign_in_request_model.dart';

class LoginController extends GetxController {
  // Initialize repository and data source directly in the Controller
  final SignInRepository repository =
  SignInRepository(LoginDataSourceImpl());

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  final isLoading = false.obs;
  final errorMessage = ''.obs;
  final box = GetStorage();


  bool _validateForm() {
    if (usernameController.text.isEmpty) {
      FocusScope.of(Get.context!).requestFocus(usernameFocusNode);
      errorMessage.value = "Username is required";
      return false;
    }
    if (passwordController.text.isEmpty) {
      FocusScope.of(Get.context!).requestFocus(passwordFocusNode);
      errorMessage.value = "Password is required";
      return false;
    }
    return true;
  }

  void login() async {
    if (!_validateForm()) { CustomSnackbar.showSnackbar(Get.context!, "Error", errorMessage.value);return;}

    isLoading.value = true;

    final loginRequest = LoginRequestModel(
      // email: usernameController.text.trim(),
      // password: passwordController.text.trim(),
      email: "admin@gmail.com",
      password: "admin",
    );

    try {
      final response = await repository.login(loginRequest);
      isLoading.value = false;
      if (response?.access.isNotEmpty ?? false) {
        Get.offAllNamed(AppRoutes.home);
      } else {
        errorMessage.value = "Invalid credentials or network issue";
      }
    } catch (e) {
      isLoading.value = false;
      errorMessage.value = "An error occurred: $e";
      print("Error3: $e");
    }
  }

  void navigateToForgetPassword() {
    Get.toNamed(AppRoutes.verifyEmail);
  }
  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    usernameFocusNode.dispose();
    passwordFocusNode.dispose();
    super.onClose();
  }
}
