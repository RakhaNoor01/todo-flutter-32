// lib/pages/dashboard/dashboard_page.dart (Versi Perbaikan)
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_project/controllers/dashboard_controller.dart';

// Import halaman-halaman yang akan ditampilkan
import 'package:todo_project/pages/home_page.dart';
import 'package:todo_project/pages/history_page.dart';
import 'package:todo_project/pages/profile_page.dart';

class DashboardPage extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.tabIndex.value,
          children: [
            HomePage(),
            HistoryPage(),
            ProfilePage(),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.tabIndex.value,
          onTap: controller.changeTabIndex,
          selectedItemColor: Colors.blueAccent, // Warna ikon & label yang aktif
          unselectedItemColor: Colors.grey[600], // Warna ikon & label yang tidak aktif
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history_edu_rounded),
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