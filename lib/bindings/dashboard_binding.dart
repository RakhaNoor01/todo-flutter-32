// lib/bindings/dashboard_binding.dart
import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';
import '../controllers/home_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    
    // Daftarkan juga HomeController di sini agar bisa digunakan oleh HomePage
    Get.lazyPut<HomeController>(() => HomeController());
  }
}