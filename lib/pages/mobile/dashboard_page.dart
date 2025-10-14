import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_project/controllers/dashboard_controller.dart';

import 'package:todo_project/pages/home_page.dart';
import 'package:todo_project/pages/history_page.dart';
import 'package:todo_project/pages/profile_page.dart';

class DashboardPageMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();

    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.tabIndex.value,
          children: [HomePage(), HistoryPage(), ProfilePage()],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.tabIndex.value,
          onTap: controller.changeTabIndex,
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.grey[600],
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history_edu_rounded),
              label: 'History',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
