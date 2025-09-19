// lib/pages/dashboard/dashboard_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/dashboard_controller.dart';
import '../pages/home_page.dart';
import '../pages/history_page.dart';
import '../pages/profile_page.dart';

class DashboardPage extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Obx akan 'mendengarkan' perubahan pada controller.tabIndex
      // dan membangun ulang body sesuai halaman yang dipilih.
      body: Obx(() => IndexedStack(
            index: controller.tabIndex.value,
            children: [
              HomePage(),
              HistoryPage(),
              ProfilePage(),
            ],
          )),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.tabIndex.value,
          onTap: controller.changeTabIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}