// lib/controllers/add_todo_controller.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:todo_project/controllers/home_controller.dart';
import 'package:todo_project/models/todo_model.dart';

class AddTodoController extends GetxController {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  var selectedPriority = Todo.priorities[0].obs;
  var selectedCategory = Todo.categories[0].obs;
  
  var selectedDate = Rxn<DateTime>();

  final HomeController _homeController = Get.find();

  void selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      selectedDate.value = picked;
    }
  }

  void addTodo() {
    if (titleController.text.isEmpty) {
      Get.snackbar('Error', 'Judul tidak boleh kosong', snackPosition: SnackPosition.BOTTOM,);
      return;
    }
    final newTodo = Todo(
      title: titleController.text,
      description: descriptionController.text,
      priority: selectedPriority.value,
      category: selectedCategory.value,
      dueDate: selectedDate.value,
    );
    _homeController.addTodo(newTodo);
    Get.back();
  }
}