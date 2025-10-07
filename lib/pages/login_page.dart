import 'package:flutter/material.dart';
import 'package:todo_list/controllers/auth_controller.dart';
import 'package:todo_list/widgets/widget_button.dart';
import 'package:todo_list/widgets/widget_textfield.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.task_alt_rounded,
                  size: 70,
                  color: Colors.blue.shade800,
                ),
                const SizedBox(height: 16),
                Text(
                  "Todo List",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade800,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Login to your account",
                  style: TextStyle(fontSize: 15, color: Colors.black54),
                ),
                const SizedBox(height: 30),

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
                CustomButton(
                  text: "Login",
                  textColor: Colors.white,
                  onPressed: () => authController.login(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}