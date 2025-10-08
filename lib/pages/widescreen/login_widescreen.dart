import 'package:flutter/material.dart';
import 'package:todo_list/controllers/auth_controller.dart';
import 'package:todo_list/widgets/widget_button.dart';
import 'package:todo_list/widgets/widget_textfield.dart';
import 'package:get/get.dart';

class LoginWidescreen extends StatelessWidget {
  LoginWidescreen({super.key});

  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            padding: const EdgeInsets.all(28),
            width: 800, // hanya wide
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.task_alt_rounded,
                        size: 100,
                        color: Colors.blue.shade800,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "Todo List",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade800,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 40),

                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Login to your account",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        textEditingController: authController.emailController,
                        hintText: "Enter Email",
                        prefixIcon: Icons.person,
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        textEditingController: authController.passwordController,
                        hintText: "Enter Password",
                        obscureText: true,
                        prefixIcon: Icons.lock,
                      ),
                      const SizedBox(height: 35),
                      SizedBox(
                        width: double.infinity,
                        child: CustomButton(
                          text: "Login",
                          textColor: Colors.white,
                          onPressed: () => authController.login(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
