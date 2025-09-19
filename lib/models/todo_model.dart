// lib/models/todo_model.dart
import 'package:get/get.dart';

class Todo {
  String title;
  String? description; // Tanda tanya (?) berarti deskripsi boleh kosong
  RxBool isDone; // RxBool adalah tipe data reaktif dari GetX

  Todo({
    required this.title,
    this.description,
    bool isDone = false, // Nilai defaultnya false
  }) : this.isDone = isDone.obs;
}