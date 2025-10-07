import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_project/controllers/login_controller.dart';

import 'mobile/profile_page.dart';
import 'widescreen/profile_page.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();

    return LayoutBuilder(
      builder: (context, constraints) {
        controller.updateLayout(constraints.maxWidth);
        return Obx(() => controller.isMobile.value ? ProfilePageMobile() : ProfilePageWidescreen());
      },
    );
  }
}
