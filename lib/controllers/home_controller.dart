// lib/controllers/home_controller.dart
import 'package:get/get.dart';
import '../models/todo_model.dart';

class HomeController extends GetxController {
  // '.obs' pada list berarti GetX akan memantau
  // semua perubahan di dalam list ini (tambah, hapus, ubah).
  var todos = <Todo>[].obs;

  @override
  void onInit() {
    // Menambahkan beberapa data awal untuk contoh
    todos.addAll([
      Todo(title: 'Selesaikan Tugas Flutter', description: 'Batas waktu hari Senin!'),
      Todo(title: 'Makan malam', isDone: true),
      Todo(title: 'Belajar GetX'),
    ]);
    super.onInit();
  }

  // Fungsi untuk mengubah status selesai/belum selesai
  void toggleTodoStatus(int index) {
    todos[index].isDone.value = !todos[index].isDone.value;
  }
}