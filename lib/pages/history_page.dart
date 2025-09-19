// lib/pages/history_page.dart (Versi Final)
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_project/controllers/home_controller.dart';
import 'package:todo_project/routes/app_routes.dart';
import 'package:todo_project/widgets/todo_card.dart';

class HistoryPage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Riwayat Tugas',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Obx(() {
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
                // Jika di-uncheck, tugas akan kembali ke HomePage
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