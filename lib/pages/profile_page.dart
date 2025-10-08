import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/controllers/todo_controller.dart';
import 'package:todo_list/pages/widescreen/profile_widescreen.dart';
import 'package:todo_list/routes/routes.dart';
import 'package:todo_list/widgets/widget_button.dart';

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

class ProfileItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const ProfileItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightBlue.shade50,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
      ),
    );
  }
}

class ProfileMobile extends StatelessWidget {
  const ProfileMobile({super.key});

  void showLogoutDialog(BuildContext context) {
    Get.defaultDialog(
      title: "Logout",
      middleText: "Are you sure you want to exit?",
      textCancel: "No",
      textConfirm: "Yes",
      confirmTextColor: Colors.white,
      buttonColor: Colors.red,
      radius: 12,
      onConfirm: () async {
        Get.back();
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.clear();
        Get.offAllNamed(AppRoutes.splashscreen);
        Get.snackbar(
          "Logged Out",
          "You have successfully logged out",
          colorText: Colors.black,
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 2),
        );
      },
      onCancel: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                'https://cdn-icons-png.flaticon.com/512/149/149071.png',
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Dira",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            const Text(
              "dira@gmail.com",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 24),

            // Profile items
            const ProfileItem(
              icon: Icons.person,
              title: "Username",
              subtitle: "Dira Mayzaro Dekantari",
            ),
            const ProfileItem(
              icon: Icons.email,
              title: "Email",
              subtitle: "dira@gmail.com",
            ),
            const ProfileItem(
              icon: Icons.phone,
              title: "Phone",
              subtitle: "0812-3456-7890",
            ),

            const SizedBox(height: 24),

            CustomButton(
              text: "Logout",
              textColor: Colors.white,
              onPressed: () => showLogoutDialog(context),
            ),
          ],
        ),
      ),
    );
  }
}
