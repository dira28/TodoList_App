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
      // appBar: AppBar(
      //   backgroundColor: Colors.deepPurple,
      //   title: Text(
      //     "Login Page",
      //     style: TextStyle(fontSize: 25, color: (Colors.white)),
      //   ),
      // ),
      
      body: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 100),

            Center(
              child: Text(
                "Todo List",
                style: TextStyle(
                  fontSize: 25,
                  color: (Colors.black),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 30),

            Center(child: Text("Login to your account")),
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 20),
              child: CustomTextField(
                textEditingController: authController.emailController,
                hintText: "Input Email",
              ),
            ),
            CustomTextField(
              textEditingController: authController.passwordController,
              hintText: "Password",
              obscureText: true,
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Center(
                child: CustomButton(
                  text: "Login",
                  textColor: Colors.white,
                  onPressed: () => authController.login()
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
