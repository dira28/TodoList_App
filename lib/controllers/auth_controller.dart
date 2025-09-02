import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/routes/routes.dart';

class AuthController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() {
    if (emailController.text == 'admin' &&
        passwordController.text == 'admin') {
           Get.offAllNamed(AppRoutes.dashboard); 
    } else {
      Get.snackbar(
        "Error",
        "Email atau password salah",
        snackPosition: SnackPosition.TOP,
      );
    }
  }
}