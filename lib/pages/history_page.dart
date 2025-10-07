import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:todo_project/controllers/history_controller.dart';
import 'mobile/history_page.dart';
import 'widescreen/history_page.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HistoryController>();

    return LayoutBuilder(
      builder: (context, constraints) {
        controller.updateLayout(constraints.maxWidth);
        return Obx(() => controller.isMobile.value ? HistoryPageMobile() : HistoryPageWidescreen());
      },
    );
  }
}
