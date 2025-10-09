import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/routes/routes.dart';
import 'package:todo_list/widgets/widget_button.dart';

class ProfileItemWide extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const ProfileItemWide({
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

class ProfileWidescreen extends StatelessWidget {
  const ProfileWidescreen({super.key});

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
    body: Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1000),
        child: SingleChildScrollView( 
          padding: const EdgeInsets.all(24.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: [
              Expanded(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircleAvatar(
                      radius: 80,
                      backgroundImage: NetworkImage(
                        'https://cdn-icons-png.flaticon.com/512/149/149071.png',
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Dira",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "dira@gmail.com",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 60),

              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const ProfileItemWide(
                      icon: Icons.person,
                      title: "Username",
                      subtitle: "Dira Mayzaro Dekantari",
                    ),
                    const ProfileItemWide(
                      icon: Icons.email,
                      title: "Email",
                      subtitle: "dira@gmail.com",
                    ),
                    const ProfileItemWide(
                      icon: Icons.phone,
                      title: "Phone",
                      subtitle: "0812-3456-7890",
                    ),
                    const SizedBox(height: 30),
                    Center(
                      child: SizedBox(
                        width: 200,
                        child: CustomButton(
                          text: "Logout",
                          textColor: Colors.white,
                          onPressed: () => showLogoutDialog(context),
                        ),
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