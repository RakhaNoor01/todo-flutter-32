import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:todo_project/controllers/home_controller.dart';
import 'package:todo_project/models/todo_model.dart';
import 'package:todo_project/routes/app_routes.dart';

class AddTodoController extends GetxController {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  var selectedPriority = Todo.priorities[0].obs;
  var selectedCategory = Todo.categories[0].obs;

  var selectedDate = Rxn<DateTime>();

  var isMobile = true.obs;
  var isLoading = false.obs;

  void updateLayout(double width) {
    isMobile.value = width < 600;
  }

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
      Get.snackbar('Error', 'Judul tidak boleh kosong', snackPosition: SnackPosition.BOTTOM);
      return;
    }
    if (isLoading.value) return;
    isLoading.value = true;
    final newTodo = Todo(
      title: titleController.text,
      description: descriptionController.text,
      priority: selectedPriority.value,
      category: selectedCategory.value,
      dueDate: selectedDate.value,
    );
    Get.snackbar('Success', 'Todo added successfully', snackPosition: SnackPosition.BOTTOM);
    Get.offNamed(Routes.dashboard);
    _homeController.addTodo(newTodo).then((_) {
      titleController.clear();
      descriptionController.clear();
      selectedPriority.value = Todo.priorities[0];
      selectedCategory.value = Todo.categories[0];
      selectedDate.value = null;
      isLoading.value = false;
    });
  }
}
