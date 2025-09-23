import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/routes/routes.dart';

class AuthController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

 void login() {
  if (emailController.text == 'admin' && passwordController.text == 'admin') {
    Get.offAllNamed(AppRoutes.dashboard);
    Get.snackbar(
      "Login Successful",
      "Welcome back! You have successfully signed in.",
      snackPosition: SnackPosition.TOP,
    );
  } else {
    Get.snackbar(
      "Login Failed",
      "The email or password you entered is incorrect. Please try again.",
      snackPosition: SnackPosition.TOP,
    );
  }
}

}