// lib/controllers/home_controller.dart

import 'package:get/get.dart';

import '../models/todo_model.dart';
import '../widgets/delete_button.dart';

class HomeController extends GetxController {
  var todos = <Todo>[].obs;
  var completedTodos = <Todo>[].obs;

  @override
  void onInit() {
    List<Todo> initialData = [
      Todo(title: 'Selesaikan Tugas Flutter', description: 'Batas waktu hari Senin!'),
      Todo(title: 'Makan malam', isDone: true),
      Todo(title: 'Belajar GetX'),
    ];

    for (var todo in initialData) {
      if (todo.isDone.value) {
        completedTodos.add(todo);
      } else {
        todos.add(todo);
      }
    }
    super.onInit();
  }

  void toggleTodoStatus(Todo todo) {
    todo.isDone.toggle();

    if (todo.isDone.value) {
      // Pindahkan dari daftar 'todos' ke 'completedTodos'
      todos.remove(todo);
      completedTodos.add(todo);
    } else {
      // Pindahkan dari daftar 'completedTodos' balik ke 'todos'
      completedTodos.remove(todo);
      todos.add(todo);
    }

  }

  void addTodo(Todo newTodo) {
    todos.add(newTodo);
  }

  void editTodo(Todo oldTodo, Todo updatedTodo) {
    // cari index tugas di daftar tugas yg aktif
    int index = todos.indexOf(oldTodo);

    if (index != -1) {
      // Jika ketemu di daftar aktif, perbarui di sana
      todos[index] = updatedTodo;
    } else {
      // Jika tidak ketemu, cari di daftar tugas selesai
      index = completedTodos.indexOf(oldTodo);
      if (index != -1) {
        // Jika ketemu di daftar selesai, perbarui di sana
        completedTodos[index] = updatedTodo;
      }
    }
  }

  void deleteTodo(Todo todo) {
    Get.dialog(
      DeleteBtn(
        todo: todo,
        onConfirmDelete: () {
          if (todo.isDone.value) {
            completedTodos.remove(todo);
          } else {
            todos.remove(todo);
          }
          Get.back();
          Get.snackbar(
            'Berhasil Dihapus',
            'Tugas "${todo.title}" telah dihapus.',
            snackPosition: SnackPosition.BOTTOM,
          );
        },
      ),
    );
  }
}