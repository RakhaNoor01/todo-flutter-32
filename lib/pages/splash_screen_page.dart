import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_project/controllers/splash_screen_controller.dart';

import 'mobile/splash_screen_page.dart';
import 'widescreen/splash_screen_page.dart';

class SplashScreenPage extends StatelessWidget {
  SplashScreenPage({super.key});
  final controller = Get.find<SplashscreenController>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        controller.updateLayout(constraints.maxWidth);
        return Obx(() => controller.isMobile.value ? SplashScreenPageMobile() : SplashScreenPageWidescreen());
      },
    );
  }
}
