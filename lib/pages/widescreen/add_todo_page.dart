import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:todo_project/controllers/add_todo_controller.dart';
import 'package:todo_project/models/todo_model.dart';
import 'package:todo_project/widgets/primary_button.dart';
import 'package:todo_project/widgets/custom_textfield.dart';

class AddTodoPageWidescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AddTodoController>();

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          'Tambah Tugas',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Container(
            width: 600,
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Detail Tugas',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 16),
                CustomTextField(
                  controller: controller.titleController,
                  hintText: 'Judul Tugas',
                  prefixIcon: Icons.title,
                ),
                SizedBox(height: 16),
                CustomTextField(
                  controller: controller.descriptionController,
                  hintText: 'Deskripsi (Opsional)',
                  prefixIcon: Icons.description,
                ),
                SizedBox(height: 24),
                Text(
                  'Kategori & Prioritas',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 16),

                Obx(
                  () => DropdownButtonFormField<String>(
                    value: controller.selectedPriority.value,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    items: Todo.priorities
                        .map((p) => DropdownMenuItem(value: p, child: Text(p)))
                        .toList(),
                    onChanged: (val) =>
                        controller.selectedPriority.value = val!,
                  ),
                ),
                SizedBox(height: 16),

                Obx(
                  () => DropdownButtonFormField<String>(
                    value: controller.selectedCategory.value,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    items: Todo.categories
                        .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                        .toList(),
                    onChanged: (val) =>
                        controller.selectedCategory.value = val!,
                  ),
                ),

                SizedBox(height: 24),
                Text(
                  'Tempo Waktu',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 16),

                Obx(
                  () => InkWell(
                    onTap: () => controller.selectDate(context),
                    child: InputDecorator(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            controller.selectedDate.value == null
                                ? 'Pilih Tanggal (Opsional)'
                                : DateFormat(
                                    'dd MMMM yyyy',
                                  ).format(controller.selectedDate.value!),
                          ),
                          Icon(Icons.calendar_today),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 32),
                PrimaryButton(
                  text: 'TAMBAH TUGAS',
                  onPressed: () => controller.addTodo(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
