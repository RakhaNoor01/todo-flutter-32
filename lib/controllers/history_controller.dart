// lib/controllers/history_controller.dart

import 'package:get/get.dart';

import 'package:todo_project/controllers/home_controller.dart';
import 'package:todo_project/models/todo_model.dart';

class HistoryController extends GetxController {
  // Mencari HomeController yang sudah ada
  final HomeController _homeController = Get.find();

  // Properti untuk menampung daftar tugas yang sudah selesai
  var completedTodos = <Todo>[].obs;

  @override
  void onInit() {
    super.onInit();
    // diisi daftar data dari HomeController
    completedTodos.assignAll(_homeController.completedTodos);

    // Buat listener. Setiap kali daftar completedTodos di HomeController di update,
    _homeController.completedTodos.listen((updatedList) {
      completedTodos.assignAll(updatedList);
    });
  }

  // Lanjutin perintah ke HomeController
  void toggleTodoStatus(Todo todo) {
    _homeController.toggleTodoStatus(todo);
  }

  void deleteTodo(Todo todo) {
    _homeController.deleteTodo(todo);
  }
}