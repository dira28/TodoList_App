import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/controllers/todo_controller.dart';
import 'package:todo_list/models/todo_model.dart';

class AddTodoPage extends StatelessWidget {
  AddTodoPage({super.key});

  final TodoController todoController = Get.find<TodoController>();

  // Controller untuk form
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();

  final RxString selectedCategory = ''.obs;

  final List<String> categories = ['Work', 'Personal', 'Study'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Todo")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Input Judul
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: "Judul",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              /// Input Deskripsi
              TextField(
                controller: descriptionController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: "Deskripsi",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              /// Dropdown Kategori
              Obx(
                () => DropdownButtonFormField<String>(
                  value: selectedCategory.value.isEmpty
                      ? null
                      : selectedCategory.value,
                  decoration: const InputDecoration(
                    labelText: "Kategori",
                    border: OutlineInputBorder(),
                  ),
                  items: categories
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      selectedCategory.value = value;
                    }
                  },
                ),
              ),
              const SizedBox(height: 16),

              /// Input Start Time
              TextField(
                controller: startTimeController,
                decoration: const InputDecoration(
                  labelText: "Start Time (contoh: 10:00)",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              /// Input End Time
              TextField(
                controller: endTimeController,
                decoration: const InputDecoration(
                  labelText: "End Time (contoh: 11:00)",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),

              /// Tombol Simpan
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (titleController.text.isNotEmpty &&
                        descriptionController.text.isNotEmpty &&
                        selectedCategory.value.isNotEmpty) {
                      todoController.addTodo(
                        TodoModel(
                          title: titleController.text,
                          description: descriptionController.text,
                          category: selectedCategory.value,
                          startTime: startTimeController.text,
                          endTime: endTimeController.text,
                        ),
                      );
                      Get.back(); // kembali ke HomePage
                    } else {
                      Get.snackbar("Error", "Lengkapi semua data!");
                    }
                  },
                  child: const Text("Simpan"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
