// lib/controllers/login_controller.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  var loginMessage = ''.obs;

  login() async {
    if(usernameController.text.toString() == "admin"
    && passwordController.text.toString() == "admin"){
      final prefs = await SharedPreferences.getInstance();
      prefs.setString("username", usernameController.text.toString());
      Get.offAllNamed(Routes.dashboard);

    } else {
      Get.snackbar("Error", "Username atau Password salah");
    }
  }

  logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("username");
    Get.offAllNamed(Routes.splashScreen);
  }
}