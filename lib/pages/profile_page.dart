import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/controllers/todo_controller.dart';
import 'package:todo_list/pages/mobile/profile_mobile.dart';
import 'package:todo_list/pages/widescreen/profile_widescreen.dart';


class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final controller = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          controller.updateLayout(constraints);
          return Obx(
            () => controller.isMobile.value
                ? ProfileMobile()
                : ProfileWidescreen(),
          );
        },
      ),
    );
  }
}