import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/routes/routes.dart';

class AuthController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() async {
    if (emailController.text == 'admin' && passwordController.text == 'admin') {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
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

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Get.offAllNamed(AppRoutes.splashscreen);
    Get.snackbar(
      "Logged Out",
      "You have successfully logged out.",
      snackPosition: SnackPosition.TOP,
    );
  }
}
