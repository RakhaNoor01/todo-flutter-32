// lib/bindings/history_binding.dart

import 'package:get/get.dart';
import 'package:todo_project/controllers/history_controller.dart';

class HistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoryController>(() => HistoryController());
  }
}