// lib/widgets/delete_dialog.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_project/models/todo_model.dart';

class DeleteBtn extends StatelessWidget {
  final Todo todo;
  final VoidCallback onConfirmDelete;
  final VoidCallback? onCancel;

  const DeleteBtn({
    super.key,
    required this.todo,
    required this.onConfirmDelete,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      title: Row(
        children: [
          Icon(Icons.warning_amber_rounded, color: Colors.red.shade400),
          SizedBox(width: 10),
          Text('Konfirmasi Hapus'),
        ],
      ),
      content: Text('Apakah Anda yakin ingin menghapus tugas "${todo.title}" secara permanen?'),
      actions: [
        OutlinedButton(
          child: Text('Batal'),
          onPressed: () {
            Get.back();
            onCancel?.call();
          },
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red.shade400,
          ),
          child: Text('Ya, Hapus', style: TextStyle(color: Colors.white)),
          // Saat ditekan, jalankan fungsi yang diberikan dari controller
          onPressed: onConfirmDelete,
        ),
      ],
    );
  }
}
