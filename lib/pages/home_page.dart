// lib/pages/home/home_page.dart
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
        // Obx akan otomatis me-rebuild widget di dalamnya
        // setiap kali ada perubahan pada list 'controller.todos'.
        if (controller.todos.isEmpty) {
          return Center(child: Text('Tidak ada tugas, hore!'));
        }
        return ListView.builder(
          itemCount: controller.todos.length,
          itemBuilder: (context, index) {
            final todo = controller.todos[index];
            // Kita gunakan Obx lagi di sini agar setiap item bisa
            // me-rebuild dirinya sendiri saat statusnya berubah.
            return Obx(() => CheckboxListTile(
                  title: Text(
                    todo.title,
                    style: TextStyle(
                      decoration: todo.isDone.value
                          ? TextDecoration.lineThrough // Coret jika selesai
                          : TextDecoration.none,
                    ),
                  ),
                  subtitle: todo.description != null
                      ? Text(todo.description!)
                      : null,
                  value: todo.isDone.value,
                  onChanged: (value) {
                    // Panggil fungsi di controller untuk mengubah status
                    controller.toggleTodoStatus(index);
                  },
                ));
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // Nanti ini akan membuka halaman tambah todo
          Get.snackbar('Info', 'Fitur Tambah Todo akan dibuat selanjutnya!');
        },
      ),
    );
  }
}