import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:todo_project/controllers/history_controller.dart';
import 'package:todo_project/routes/app_routes.dart';
import 'package:todo_project/widgets/todo_card.dart';

class HistoryPageWidescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HistoryController>();

    return Obx(() {
      if (controller.completedTodos.isEmpty) {
        return const Center(child: Text('Belum ada tugas yang diselesaikan.'));
      }
      return GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 2.0,
        ),
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
    });
  }
}
