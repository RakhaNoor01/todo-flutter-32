import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:todo_project/controllers/home_controller.dart';
import 'package:todo_project/routes/app_routes.dart';
import 'package:todo_project/widgets/todo_card.dart';

class HomePageMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Daftar Tugas',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Obx(() {
        // memantau seluruh list
        if (controller.todos.isEmpty) {
          return Center(child: Text('Tidak ada tugas, hore!'));
        }
        return ListView.builder(
          padding: EdgeInsets.all(8.0),
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
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.toNamed(Routes.addTodo);
        },
      ),
    );
  }
}
