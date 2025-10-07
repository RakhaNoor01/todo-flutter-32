import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_project/controllers/dashboard_controller.dart';

import 'mobile/dashboard_page.dart';
import 'widescreen/dashboard_page.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();

    return LayoutBuilder(
      builder: (context, constraints) {
        controller.updateLayout(constraints.maxWidth);
        return Obx(() => controller.isMobile.value 
        ? DashboardPageMobile() 
        : DashboardPageWidescreen());
      },
    );
  }
}
