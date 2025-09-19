// lib/controllers/home_controller.dart
import 'package:get/get.dart';
import '../models/todo_model.dart';

class HomeController extends GetxController {
  // Daftar untuk tugas yang BELUM selesai
  var todos = <Todo>[].obs;
  // DAFTAR BARU: untuk tugas yang SUDAH selesai
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

  // --- FUNGSI UTAMA: LOGIKA PINDAH DAFTAR ---
  void toggleTodoStatus(Todo todo) {
    // Ubah statusnya
    todo.isDone.toggle();

    if (todo.isDone.value) {
      // Jika sekarang statusnya SELESAI:
      // Pindahkan dari daftar 'todos' ke 'completedTodos'
      todos.remove(todo);
      completedTodos.add(todo);
    } else {
      // Jika sekarang statusnya BELUM SELESAI:
      // Pindahkan dari daftar 'completedTodos' kembali ke 'todos'
      completedTodos.remove(todo);
      todos.add(todo);
    }
  }
}