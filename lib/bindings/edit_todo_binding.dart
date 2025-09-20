// lib/bindings/edit_todo_binding.dart
import 'package:get/get.dart';
import 'package:todo_project/controllers/edit_todo_controller.dart';

class EditTodoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditTodoController>(() => EditTodoController());
  }
}