// lib/models/todo_model.dart
import 'package:get/get.dart';

class Todo {
  int? id;
  String title;
  String? description;
  RxBool isDone;

  String priority;
  String category;
  DateTime? dueDate;

  // Daftar
  static const List<String> priorities = ['Low', 'Important', 'Urgent'];
  static const List<String> categories = ['Personal', 'Keluarga', 'Pekerjaan', 'Sekolah'];

  Todo({
    this.id,
    required this.title,
    this.description,
    bool isDone = false,

    // Defaultnya disini king
    this.priority = 'Low',
    this.category = 'Personal',
    this.dueDate,
  }) : this.isDone = isDone.obs;
}
