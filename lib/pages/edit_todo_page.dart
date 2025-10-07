import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/todo_controller.dart';
import '../models/todo_model.dart';
import '../widgets/widget_textfield.dart';

class EditTodoPage extends StatelessWidget {
  final TodoModel todo;

  EditTodoPage({super.key, required this.todo});

  final TodoController todoController = Get.find<TodoController>();
  final List<String> categories = ['Work', 'Personal', 'Study'];

  @override
  Widget build(BuildContext context) {
    todoController.fillForm(todo);

    return Scaffold(
      appBar: AppBar(title: const Text("Edit Todo")),
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
                    labelText: "Category",
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
                    // pakai id asli todo supaya update tersimpan di DB
                    final updatedTodo = TodoModel(
                      id: todo.id,
                      title: todoController.titleController.text,
                      description: todoController.descriptionController.text,
                      category: todoController.selectedCategory.value,
                      startTime: todoController.startTimeController.text,
                      endTime: todoController.endTimeController.text,
                      isDone: todo.isDone,
                    );

                    todoController.updateTodo(updatedTodo);
                    todoController.clearForm();
                  },
                  child: const Text("Update Todo"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
