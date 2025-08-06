import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../../core/constants/app_constant.dart';
import '../../../core/widget/snackbar/custom_snackbar.dart';
import '../../../routes/app_routes.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class SingUpController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  FocusNode nameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode phoneFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode confirmPasswordFocusNode = FocusNode();

  // Helper method to validate fields
  bool validateField(TextEditingController controller, FocusNode focusNode, String fieldName) {
    if (controller.text.isEmpty) {
      FocusScope.of(Get.context!).requestFocus(focusNode);
      CustomSnackbar.showSnackbar(Get.context!, "Error", "$fieldName is required");
      return false;
    }
    return true;
  }

  // Sign-up method with API call
  void signUp() async {
    // Validate all fields
    if (!validateField(nameController, nameFocusNode, "Name") ||
        !validateField(emailController, emailFocusNode, "Email") ||
        !validateField(phoneController, phoneFocusNode, "Phone") ||
        !validateField(passwordController, passwordFocusNode, "Password") ||
        !validateField(confirmPasswordController, confirmPasswordFocusNode, "Confirm Password")) {
      return;
    }

    // Ensure passwords match
    if (passwordController.text != confirmPasswordController.text) {
      CustomSnackbar.showSnackbar(Get.context!, "Error", "Passwords do not match");
      return;
    }

    // Prepare the request body
    var requestBody = {
      'email': emailController.text.trim(),
      'full_name': nameController.text.trim(),
      'phone_number': phoneController.text.trim(),
      'password': passwordController.text.trim(),
      'password2': confirmPasswordController.text.trim(),
    };

    try {
      var response = await http.post(
        Uri.parse(AppConstant.instance.baseUrl + AppConstant.instance.singUpEndpoint),
        headers: {"Content-Type": "application/json"},
        body: json.encode(requestBody),
      );

      if (response.statusCode == 201) {
        // If the API call is successful
        var responseData = json.decode(response.body);
        CustomSnackbar.showSnackbar(Get.context!, "Success", responseData['message'] ?? 'Registration successful', textColor: Colors.greenAccent);
        print("Success: $responseData");
        // Navigate to another screen (e.g., sign_in screen)
        Get.toNamed(AppRoutes.login);
      } else {
        // If the response code is not 201, show error message
        var errorData = json.decode(response.body);
        CustomSnackbar.showSnackbar(Get.context!, "Error", errorData['message'] ?? 'Registration failed');
      }
    } catch (e) {
      // Handle any errors during the API call
      print('Error during sign-up API call: $e');
      CustomSnackbar.showSnackbar(Get.context!, "Error", "Failed to register. Please try again.");
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
