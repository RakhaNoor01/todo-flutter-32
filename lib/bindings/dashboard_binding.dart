// lib/bindings/dashboard_binding.dart

import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';
import '../controllers/home_controller.dart';
import '../controllers/history_controller.dart';
import '../controllers/login_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<HistoryController>(() => HistoryController());
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
