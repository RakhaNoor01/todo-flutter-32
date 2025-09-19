// lib/controllers/edit_todo_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_project/controllers/home_controller.dart';
import 'package:todo_project/models/todo_model.dart';

class EditTodoController extends GetxController {
  final HomeController _homeController = Get.find();
  late Todo todo; // Variabel untuk menyimpan todo yang sedang diedit

  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late var selectedPriority;
  late var selectedCategory;
  late var selectedDate;

  @override
  void onInit() {
    super.onInit();
    // Ambil objek 'todo' yang dikirim dari halaman sebelumnya
    todo = Get.arguments;

    // Isi semua controller & state dengan data dari todo yang ada
    titleController = TextEditingController(text: todo.title);
    descriptionController = TextEditingController(text: todo.description);
    selectedPriority = todo.priority.obs;
    selectedCategory = todo.category.obs;
    selectedDate = Rxn<DateTime>(todo.dueDate);
  }

  void editTodo() {
    if (titleController.text.isEmpty) {
      Get.snackbar('Error', 'Judul tidak boleh kosong');
      return;
    }

    // Buat objek Todo yang sudah diupdate
    final updatedTodo = Todo(
      title: titleController.text,
      description: descriptionController.text,
      priority: selectedPriority.value,
      category: selectedCategory.value,
      dueDate: selectedDate.value,
      isDone: todo.isDone.value, // Pastikan status isDone tidak berubah
    );

    _homeController.editTodo(todo, updatedTodo);
    Get.back(); // Kembali ke halaman Home
  }
}