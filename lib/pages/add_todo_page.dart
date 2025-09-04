import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/controllers/todo_controller.dart';
import 'package:todo_list/widgets/widget_textfield.dart';

class AddTodoPage extends StatelessWidget {
  AddTodoPage({super.key});

  final TodoController todoController = Get.find<TodoController>();

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
              CustomTextField(
                textEditingController: todoController.titleController,
                hintText: "Title",
              ),
              const SizedBox(height: 16),

              CustomTextField(
                textEditingController: todoController.descriptionController,
                hintText: "Description",
                maxLines: 3,
              ),
              const SizedBox(height: 16),

              Obx(
                () => DropdownButtonFormField<String>(
                  value: todoController.selectedCategory.value.isEmpty
                      ? null
                      : todoController.selectedCategory.value,
                  decoration: const InputDecoration(
                    labelText: "Kategori",
                    border: OutlineInputBorder(),
                  ),
                  items: categories
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      todoController.selectedCategory.value = value;
                    }
                  },
                ),
              ),
              const SizedBox(height: 16),

              CustomTextField(
                textEditingController: todoController.startTimeController,
                hintText: "Start Time",
              ),
              const SizedBox(height: 16),

              CustomTextField(
                textEditingController: todoController.endTimeController,
                hintText: "End Time",
              ),
              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    todoController.saveTodo();
                  },
                  child: const Text("Save"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
