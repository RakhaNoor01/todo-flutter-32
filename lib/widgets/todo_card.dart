// lib/widgets/todo_card.dart

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_project/models/todo_model.dart';

class TodoCard extends StatelessWidget {
  final Todo todo;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final Function(bool?) onToggleStatus;

  const TodoCard({
    super.key,
    required this.todo,
    required this.onEdit,
    required this.onDelete,
    required this.onToggleStatus,
  });

  // Helper buat dapetin warna based prioritas
  Color _getPriorityColor(String priority) {
    switch (priority) {
      case 'Urgent':
        return Colors.red.shade400;
      case 'Important':
        return Colors.orange.shade400;
      case 'Low':
      default:
        return Colors.green.shade400;
    }
  }

  // Helper widget untuk "tag"
  Widget _buildInfoChip(String text, IconData icon, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Checkbox
            Checkbox(
              value: todo.isDone.value,
              onChanged: onToggleStatus,
            ),
            SizedBox(width: 8),

            // Konten utama (Judul, Deskripsi, Tags)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    todo.title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      decoration: todo.isDone.value
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  if (todo.description != null && todo.description!.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(todo.description!),
                    ),
                  SizedBox(height: 12),

                  // Baris untuk semua tag
                  Wrap(
                    spacing: 8.0, // Jarak horizontal antar tag
                    runSpacing: 4.0, // Jarak vertikal jika tag turun ke baris baru
                    children: [
                      _buildInfoChip(todo.priority, Icons.flag_outlined, _getPriorityColor(todo.priority)),
                      _buildInfoChip(todo.category, Icons.bookmark_border_outlined, Colors.blueGrey),
                      if (todo.dueDate != null)
                        _buildInfoChip(
                          DateFormat('dd MMM yyyy').format(todo.dueDate!),
                          Icons.calendar_today_outlined,
                          Colors.purple,
                        ),
                    ],
                  )
                ],
              ),
            ),

            // Tombol Edit & Delete
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(icon: Icon(Icons.edit_outlined, color: Colors.blue), onPressed: onEdit),
                IconButton(icon: Icon(Icons.delete_outline, color: Colors.red), onPressed: onDelete),
              ],
            ),
          ],
        ),
      ),
    );
  }
}