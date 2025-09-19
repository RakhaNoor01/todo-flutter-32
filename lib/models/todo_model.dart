// lib/models/todo_model.dart
import 'package:get/get.dart';

// Menambahkan Enum untuk pilihan yang pasti, ini lebih aman dari string biasa
enum Priority { Low, Important, Urgent }
enum Category { Personal, Keluarga, Pekerjaan, Sekolah }

class Todo {
  String title;
  String? description;
  RxBool isDone;

  // --- PROPERTI BARU ---
  Priority priority;
  Category category;
  DateTime? dueDate; // Tanggal boleh kosong

  Todo({
    required this.title,
    this.description,
    bool isDone = false,
    this.priority = Priority.Low,
    this.category = Category.Personal,
    this.dueDate,
  }) : this.isDone = isDone.obs;
}