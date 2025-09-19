// lib/pages/home/home_page.dart (Versi Perbaikan)

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_project/controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Tugasku'),
        automaticallyImplyLeading: false,
      ),
      body: Obx(() {
        if (controller.todos.isEmpty) {
          return Center(child: Text('Tidak ada tugas, hore!'));
        }
        return ListView.builder(
          itemCount: controller.todos.length,
          itemBuilder: (context, index) {
            final todo = controller.todos[index];
            return Obx(() => CheckboxListTile(
                  title: Text(
                    todo.title,
                    style: TextStyle(
                      decoration: todo.isDone.value
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  subtitle: todo.description != null
                      ? Text(todo.description!)
                      : null,
                  value: todo.isDone.value,
                  onChanged: (value) {
                    // --- DI SINI PERBAIKANNYA ---
                    // Kirim seluruh objek 'todo', bukan hanya 'index'.
                    controller.toggleTodoStatus(todo);
                  },
                ));
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.snackbar('Info', 'Fitur Tambah Todo akan dibuat selanjutnya!');
        },
      ),
    );
  }
}