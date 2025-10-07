import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:todo_project/controllers/home_controller.dart';
import 'mobile/home_page.dart';
import 'widescreen/home_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return LayoutBuilder(
      builder: (context, constraints) {
        controller.updateLayout(constraints.maxWidth);
        return Obx(() => controller.isMobile.value ? HomePageMobile() : HomePageWidescreen());
      },
    );
  }
}
