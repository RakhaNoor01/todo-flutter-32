// lib/controllers/add_todo_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_project/controllers/home_controller.dart';
import 'package:todo_project/models/todo_model.dart';

class AddTodoController extends GetxController {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  // State untuk dropdown dan date picker
  var selectedPriority = Priority.Low.obs;
  var selectedCategory = Category.Personal.obs;
  var selectedDate = Rxn<DateTime>(); // Rxn agar bisa bernilai null

  final HomeController _homeController = Get.find();

  void addTodo() {
    if (titleController.text.isEmpty) {
      Get.snackbar('Error', 'Judul tidak boleh kosong');
      return;
    }

    final newTodo = Todo(
      title: titleController.text,
      description: descriptionController.text,
      priority: selectedPriority.value,
      category: selectedCategory.value,
      dueDate: selectedDate.value,
    );

    _homeController.addTodo(newTodo); // Kirim todo baru ke HomeController
    Get.back(); // Kembali ke halaman sebelumnya (Home)
  }
}