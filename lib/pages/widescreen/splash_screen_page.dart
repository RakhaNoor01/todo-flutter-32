import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_project/controllers/splash_screen_controller.dart';

class SplashScreenPageWidescreen extends StatelessWidget {
  SplashScreenPageWidescreen({super.key});
  final controller = Get.find<SplashscreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text("ini splashscreen"),
        ),
      ),
    );
  }
}
