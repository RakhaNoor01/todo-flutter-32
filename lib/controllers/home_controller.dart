// lib/controllers/home_controller.dart

import 'package:get/get.dart';

import '../models/todo_model.dart';
import '../widgets/delete_button.dart';
import '../helper/db_helper.dart';

class HomeController extends GetxController {
  var todos = <Todo>[].obs;
  var completedTodos = <Todo>[].obs;
  final _dbHelper = DBHelper();

  var isMobile = true.obs;

  void updateLayout(double width) {
    isMobile.value = width < 600;
  }

  @override
  void onInit() {
    super.onInit();
    fetchTodos();
  }

  Future<void> fetchTodos() async {
    final allTodos = await _dbHelper.getTodos();
    todos.clear();
    completedTodos.clear();
    for (var todo in allTodos) {
      if (todo.isDone.value) {
        completedTodos.add(todo);
      } else {
        todos.add(todo);
      }
    }
  }

  void toggleTodoStatus(Todo todo) async {
    todo.isDone.toggle();
    await _dbHelper.updateTodo(todo);
    await fetchTodos();
  }

  void addTodo(Todo newTodo) async {
    await _dbHelper.insertTodo(newTodo);
    await fetchTodos();
  }

  void editTodo(Todo oldTodo, Todo updatedTodo) async {
    await _dbHelper.updateTodo(updatedTodo);
    await fetchTodos();
  }

  void deleteTodo(Todo todo) {
    Get.dialog(
      DeleteBtn(
        todo: todo,
        onConfirmDelete: () async {
          await _dbHelper.deleteTodo(todo.id!);
          await fetchTodos();
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
