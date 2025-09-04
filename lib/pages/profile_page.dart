import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/routes/routes.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  // Fungsi untuk menampilkan dialog konfirmasi logout
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
      radius: 10,
      actions: [
        TextButton(
          onPressed: () => Get.back(), // Tutup dialog
          child: const Text("No", style: TextStyle(color: Colors.blueAccent)),
        ),
        ElevatedButton(
          onPressed: () {
            Get.back(); // Tutup dialog
            Get.offAllNamed(AppRoutes.login); // Redirect ke halaman login
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Profile",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              const CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                  'https://cdn-icons-png.flaticon.com/512/149/149071.png',
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Dira",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "dira@gmail.com",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 32),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.person, color: Colors.blueAccent),
                title: const Text("Username"),
                subtitle: const Text("Dira Mayzaro Dekantari"),
              ),
              ListTile(
                leading: const Icon(Icons.email, color: Colors.blueAccent),
                title: const Text("Email"),
                subtitle: const Text("dira@gmail.com"),
              ),
              ListTile(
                leading: const Icon(Icons.phone, color: Colors.blueAccent),
                title: const Text("Phone"),
                subtitle: const Text("0812-3456-7890"),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  showLogoutDialog(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                child: const Text("Logout"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
