// lib/pages/history/history_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_project/controllers/home_controller.dart';

// Kita gunakan GetView<HomeController> karena data riwayat juga ada di sana
class HistoryPage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Riwayat Tugas')),
      body: Obx(() {
        // Kali ini, kita pantau daftar 'completedTodos'
        if (controller.completedTodos.isEmpty) {
          return Center(child: Text('Belum ada tugas yang diselesaikan.'));
        }
        return ListView.builder(
          itemCount: controller.completedTodos.length,
          itemBuilder: (context, index) {
            final todo = controller.completedTodos[index];
            return Obx(() => CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text(
                    todo.title,
                    style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey[600],
                    ),
                  ),
                  subtitle: todo.description != null
                      ? Text(todo.description!)
                      : null,
                  value: todo.isDone.value,
                  onChanged: (value) {
                    // Jika di-uncheck, tugas akan kembali ke HomePage
                    controller.toggleTodoStatus(todo);
                  },
                ));
          },
        );
      }),
    );
  }
}