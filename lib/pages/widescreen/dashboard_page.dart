// widescreen/dashboard_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:todo_project/controllers/dashboard_controller.dart';

import 'package:todo_project/pages/widescreen/history_page.dart';
import 'package:todo_project/pages/widescreen/home_page.dart';
import 'package:todo_project/pages/widescreen/profile_page.dart';

import 'package:todo_project/routes/app_routes.dart';

class DashboardPageWidescreen extends StatelessWidget {
  final List<Widget> pages = [
    HomePageWidescreen(),
    HistoryPageWidescreen(),
    ProfilePageWidescreen(),
  ];
  final List<String> titles = ['Daftar Tugas', 'Riwayat', 'Profil'];

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,

        title: Obx(
          () => Text(
            titles[controller.tabIndex.value],
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),

        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blueAccent),
              child: Text(
                'Menu Navigasi',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),

            Obx(
              () => ListTile(
                leading: const Icon(Icons.home_filled),
                title: const Text('Home'),
                selected: controller.tabIndex.value == 0,
                selectedTileColor: Colors.blueAccent.withOpacity(0.1),
                onTap: () {
                  controller.changeTabIndex(0);
                  Get.back();
                },
              ),
            ),
            Obx(
              () => ListTile(
                leading: const Icon(Icons.history_edu_rounded),
                title: const Text('History'),
                selected: controller.tabIndex.value == 1,
                selectedTileColor: Colors.blueAccent.withOpacity(0.1),
                onTap: () {
                  controller.changeTabIndex(1);
                  Get.back();
                },
              ),
            ),
            Obx(
              () => ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Profile'),
                selected: controller.tabIndex.value == 2,
                selectedTileColor: Colors.blueAccent.withOpacity(0.1),
                onTap: () {
                  controller.changeTabIndex(2);
                  Get.back();
                },
              ),
            ),
          ],
        ),
      ),

      body: Obx(
        () => IndexedStack(index: controller.tabIndex.value, children: pages),
      ),

      floatingActionButton: Obx(
        () => controller.tabIndex.value == 0
            ? FloatingActionButton(
                child: const Icon(Icons.add),
                onPressed: () {
                  Get.toNamed(Routes.addTodo);
                },
              )
            : Container(),
      ),
    );
  }
}
