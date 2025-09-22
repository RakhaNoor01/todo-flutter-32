// lib/controllers/edit_todo_controller.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:todo_project/controllers/home_controller.dart';
import 'package:todo_project/models/todo_model.dart';

class EditTodoController extends GetxController {
  final HomeController _homeController = Get.find();
  late Todo todo;

  late TextEditingController titleController;
  late TextEditingController descriptionController;
  
  late var selectedPriority = Todo.priorities[0].obs;
  late var selectedCategory = Todo.categories[0].obs;

  late var selectedDate = Rxn<DateTime>();

  @override
  void onInit() {
    super.onInit();
    todo = Get.arguments;

    titleController = TextEditingController(text: todo.title);
    
    descriptionController = TextEditingController(text: todo.description ?? ''); // Kalo kosong, pakai string kosong ''

    selectedPriority.value = todo.priority;
    selectedCategory.value = todo.category;
    selectedDate.value = todo.dueDate;
  }

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

  void editTodo() {
    if (titleController.text.isEmpty) {
      Get.snackbar('Error', 'Judul tidak boleh kosong');
      return;
    }

    final updatedTodo = Todo(
      title: titleController.text,
      description: descriptionController.text,
      priority: selectedPriority.value,
      category: selectedCategory.value,
      dueDate: selectedDate.value,
      isDone: todo.isDone.value,
    );

    _homeController.editTodo(todo, updatedTodo);
    Get.back();
  }
}