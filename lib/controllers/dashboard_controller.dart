// lib/controllers/dashboard_controller.dart

import 'package:get/get.dart';

class DashboardController extends GetxController {
  // Variabel reaktif untuk menyimpan indeks tab yang sedang aktif.
  // 0 = Home, 1 = History, 2 = Profile
  var tabIndex = 0.obs;

  // Fungsi untuk mengubah tab saat item navigasi ditekan.
  void changeTabIndex(int index) {
    tabIndex.value = index;
  }
}