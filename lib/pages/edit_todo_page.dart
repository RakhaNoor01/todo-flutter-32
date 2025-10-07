import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:todo_project/controllers/edit_todo_controller.dart';
import 'mobile/edit_todo_page.dart';
import 'widescreen/edit_todo_page.dart';

class EditTodoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<EditTodoController>();

    return LayoutBuilder(
      builder: (context, constraints) {
        controller.updateLayout(constraints.maxWidth);
        return Obx(() => controller.isMobile.value ? EditTodoPageMobile() : EditTodoPageWidescreen());
      },
    );
  }
}
