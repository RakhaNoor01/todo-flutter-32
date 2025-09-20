// lib/bindings/login_binding.dart
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    // Kita tetap pakai lazyPut karena lebih efisien
    Get.lazyPut<LoginController>(() => LoginController());
  }
}