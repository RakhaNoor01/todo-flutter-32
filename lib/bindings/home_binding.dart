// lib/bindings/home_binding.dart
import 'package:get/get.dart';
import '../controllers/home_controller.dart'; // Import controller

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // Daftarkan HomeController
    Get.lazyPut<HomeController>(() => HomeController());
  }
}