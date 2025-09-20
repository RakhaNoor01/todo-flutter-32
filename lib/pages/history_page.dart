// lib/pages/history/history_page.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_project/controllers/history_controller.dart';
import 'package:todo_project/routes/app_routes.dart';
import 'package:todo_project/widgets/todo_card.dart';

class HistoryPage extends GetView<HistoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat Tugas'),
        backgroundColor: Colors.blueAccent,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.grey[200],
      body: Obx(() {
        // memantau daftar 'completedTodos' dari HistoryController
        if (controller.completedTodos.isEmpty) {
          return Center(child: Text('Belum ada tugas yang diselesaikan.'));
        }
        return ListView.builder(
          padding: EdgeInsets.all(8.0),
          itemCount: controller.completedTodos.length,
          itemBuilder: (context, index) {
            final todo = controller.completedTodos[index];
            return TodoCard(
              todo: todo,
              onToggleStatus: (value) {
                controller.toggleTodoStatus(todo);
              },
              onEdit: () => Get.toNamed(Routes.editTodo, arguments: todo),
              onDelete: () => controller.deleteTodo(todo),
            );
          },
        );
      }),
    );
  }
}