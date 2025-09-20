// lib/controllers/home_controller.dart

import 'package:get/get.dart';
import '../models/todo_model.dart';
import '../widgets/delete_button.dart';

class HomeController extends GetxController {
  var todos = <Todo>[].obs;
  var completedTodos = <Todo>[].obs;

  @override
  void onInit() {
    // Memisahkan data awal ke daftar yang sesuai
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
    // Ubah statusnya
    todo.isDone.toggle();

    if (todo.isDone.value) {
      // Jika statusnya SELESAI:
      // Pindahkan dari daftar 'todos' ke 'completedTodos'
      todos.remove(todo);
      completedTodos.add(todo);
    } else {
      // Jika statusnya BELUM SELESAI:
      // Pindahkan dari daftar 'completedTodos' kembali ke 'todos'
      completedTodos.remove(todo);
      todos.add(todo);
    }

  }

  void addTodo(Todo newTodo) {
    todos.add(newTodo);
  }

  void editTodo(Todo oldTodo, Todo updatedTodo) {
    int index = todos.indexOf(oldTodo);
    if (index != -1) {
      todos[index] = updatedTodo;
    }
  }

  void deleteTodo(Todo todo) {
    Get.dialog(
      DeleteBtn(
        todo: todo,
        onConfirmDelete: () {
          // Logika delete
          if (todo.isDone.value) {
            completedTodos.remove(todo);
          } else {
            todos.remove(todo);
          }
          Get.back(); // Tutup dialog
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