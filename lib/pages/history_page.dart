import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/pages/mobile/history_mobile.dart';
import 'package:todo_list/pages/widescreen/history_widescreen.dart';
import '../controllers/todo_controller.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});

  final controller = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        controller.updateLayout(constraints);
        return Obx(
          () =>
              controller.isMobile.value ? HistoryMobile() : HistoryWidescreen(),
        );
      },
    );
  }
}