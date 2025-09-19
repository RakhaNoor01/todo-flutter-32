// lib/pages/add_todo/add_todo_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_project/controllers/add_todo_controller.dart';
import 'package:todo_project/models/todo_model.dart';
import 'package:todo_project/widgets/primary_button.dart';
import 'package:todo_project/widgets/custom_textfield.dart';

class AddTodoPage extends GetView<AddTodoController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tambah Tugas Baru')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(controller: controller.titleController, hintText: 'Judul Tugas'),
            SizedBox(height: 16),
            CustomTextField(controller: controller.descriptionController, hintText: 'Deskripsi (Opsional)'),
            SizedBox(height: 24),

            Text('Prioritas', style: TextStyle(fontWeight: FontWeight.bold)),
            Obx(() => DropdownButton<Priority>(
                  value: controller.selectedPriority.value,
                  isExpanded: true,
                  items: Priority.values.map((p) => DropdownMenuItem(value: p, child: Text(p.name))).toList(),
                  onChanged: (val) => controller.selectedPriority.value = val!,
                )),
            SizedBox(height: 16),

            Text('Kategori', style: TextStyle(fontWeight: FontWeight.bold)),
            Obx(() => DropdownButton<Category>(
                  value: controller.selectedCategory.value,
                  isExpanded: true,
                  items: Category.values.map((c) => DropdownMenuItem(value: c, child: Text(c.name))).toList(),
                  onChanged: (val) => controller.selectedCategory.value = val!,
                )),
            SizedBox(height: 16),

            // Date Picker
            Obx(() => ListTile(
                  title: Text(controller.selectedDate.value == null
                      ? 'Pilih Tanggal (Opsional)'
                      : 'Tenggat: ${controller.selectedDate.value!.day}/${controller.selectedDate.value!.month}/${controller.selectedDate.value!.year}'),
                  trailing: Icon(Icons.calendar_today),
                  onTap: () async {
                    DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                    );
                    if (picked != null) {
                      controller.selectedDate.value = picked;
                    }
                  },
                )),
            SizedBox(height: 32),

            PrimaryButton(text: 'SIMPAN TUGAS', onPressed: () => controller.addTodo()),
          ],
        ),
      ),
    );
  }
}