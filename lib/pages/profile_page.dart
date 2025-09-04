import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/routes/routes.dart';
import 'package:todo_list/widgets/widget_button.dart';

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

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  void showLogoutDialog(BuildContext context) {
    Get.defaultDialog(
      title: "Logout",
      middleText: "Are you sure you want to exit?",
      backgroundColor: Colors.white,
      titleStyle: const TextStyle(
        color: Colors.blueAccent,
        fontWeight: FontWeight.bold,
      ),
      middleTextStyle: const TextStyle(color: Colors.black87),
      radius: 12,
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: const Text("No", style: TextStyle(color: Colors.blueAccent)),
        ),
        ElevatedButton(
          onPressed: () {
            Get.back();
            Get.offAllNamed(AppRoutes.login);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue.shade600,
            foregroundColor: Colors.white,
          ),
          child: const Text("Yes"),
        ),
      ],
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
      body: SafeArea(
        child: Padding(
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
      ),
    );
  }
}
