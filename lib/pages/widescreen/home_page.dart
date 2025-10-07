import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:todo_project/controllers/home_controller.dart';
import 'package:todo_project/routes/app_routes.dart';
import 'package:todo_project/widgets/todo_card.dart';

class HomePageWidescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Obx(() {
      if (controller.todos.isEmpty) {
        return const Center(child: Text('Tidak ada tugas, hore!'));
      }
      return GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 2.0,
        ),
        itemCount: controller.todos.length,
        itemBuilder: (context, index) {
          final todo = controller.todos[index];
          return TodoCard(
            todo: todo,
            onToggleStatus: (value) => controller.toggleTodoStatus(todo),
            onEdit: () => Get.toNamed(Routes.editTodo, arguments: todo),
            onDelete: () => controller.deleteTodo(todo),
          );
        },
      );
    });
  }
}
