import 'package:flutter/material.dart';
import 'package:todo_list/controllers/auth_controller.dart';
import 'package:todo_list/pages/mobile/login_mobile.dart';
import 'package:todo_list/pages/widescreen/login_widescreen.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

 final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          controller.updateLayout(constraints);
          return Obx(
            () => controller.isMobile.value
                ? LoginMobile()
                : LoginWidescreen(),
          );
        },
      ),
    );
  }
}