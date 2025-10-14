// home_page.dart
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
      
      return LayoutBuilder(
        builder: (context, constraints) {
          final double availableWidth = constraints.maxWidth;

          int crossAxisCount = 2;
          if (availableWidth > 900) {
            crossAxisCount = 3;
          } else if (availableWidth > 600) {
            crossAxisCount = 2;
          }
          double childAspectRatio = 2.5;
          
          if (crossAxisCount == 3) {
             childAspectRatio = 3.5;
          }

          return GridView.builder(
            padding: const EdgeInsets.all(16.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount, 
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              childAspectRatio: childAspectRatio,
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
        },
      );
    });
  }
}