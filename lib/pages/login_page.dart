import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';
import 'mobile/login_page.dart';
import 'widescreen/login_page.dart';

class LoginPage extends StatelessWidget {
  final LoginController controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        controller.updateLayout(constraints.maxWidth);
        return Obx(() => controller.isMobile.value ? LoginPageMobile() : LoginPageWidescreen());
      },
    );
  }
}
