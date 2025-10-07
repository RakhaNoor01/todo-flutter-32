import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:todo_project/controllers/add_todo_controller.dart';
import 'mobile/add_todo_page.dart';
import 'widescreen/add_todo_page.dart';

class AddTodoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AddTodoController>();

    return LayoutBuilder(
      builder: (context, constraints) {
        controller.updateLayout(constraints.maxWidth);
        return Obx(() => controller.isMobile.value ? AddTodoPageMobile() : AddTodoPageWidescreen());
      },
    );
  }
}
