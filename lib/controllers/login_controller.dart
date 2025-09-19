import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/app_routes.dart';

class LoginController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  var loginMessage = ''.obs;

  void login() {
    String username = usernameController.text;
    String password = passwordController.text;

    if (username == 'admin' && password == 'password') {
      loginMessage.value = 'Login berhasil!';

      print("Kondisi login terpenuhi, mencoba navigasi ke /home...");

      Future.delayed(Duration(seconds: 1), () {
        Get.offAllNamed(Routes.dashboard);
      });
    } else {
      loginMessage.value = 'Username atau password salah.';
    }
  }
}