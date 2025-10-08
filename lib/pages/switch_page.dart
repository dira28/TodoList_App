// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:todo_list/controllers/auth_controller.dart';
// import 'package:todo_list/pages/login_page.dart';
// import 'package:todo_list/pages/widescreen/login_widescreen.dart';

// class SwitchPage extends StatelessWidget {
//   SwitchPage({super.key});

//   final controller = Get.find<AuthController>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: LayoutBuilder(
//         builder: (context, constraints) {
//           controller.updateLayout(constraints);
//           return Obx(
//             () => controller.isMobile.value
//                 ? LoginPage()
//                 : LoginWidescreen(),
//           );
//         },
//       ),
//     );
//   }
// }
