import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/pages/mobile/home_mobile.dart';
import 'package:todo_list/pages/widescreen/home_widescreen.dart';
import '../controllers/todo_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final controller = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        controller.updateLayout(constraints);
        return Obx(
          () => controller.isMobile.value ? HomeMobile() : HomeWidescreen(),
        );
      },
    );
  }
}