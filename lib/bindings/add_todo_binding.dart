// lib/bindings/add_todo_binding.dart

import 'package:get/get.dart';
import 'package:todo_project/controllers/add_todo_controller.dart';

class AddTodoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddTodoController>(() => AddTodoController());
  }
}