import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/controllers/home_controller.dart';
import 'home_page.dart';
import 'history_page.dart';
import 'profile_page.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});

  final HomeController homeController = Get.find<HomeController>();

  final List<Widget> pages = [HomePage(), HistoryPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: pages[homeController.currentIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: homeController.currentIndex.value,
          onTap: (index) => homeController.changePage(index),
          selectedItemColor: Colors.blue.shade800,
          unselectedItemColor: Colors.grey.shade600,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
