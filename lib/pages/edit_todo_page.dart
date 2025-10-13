import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/widgets/widget_button.dart';
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Edit Todo",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        backgroundColor: Colors.lightBlueAccent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
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
                      decoration: InputDecoration(
                        hintText: "Select Category",
                        filled: true,
                        fillColor: Colors.transparent,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 12,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.blue.shade700),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.blue.shade700),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Colors.blue.shade900,
                            width: 2,
                          ),
                        ),
                      ),
                      iconEnabledColor: Colors.blue.shade700,
                      items: categories
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(
                                e,
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                          )
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
                    textEditingController:
                        todoController.startTimeController,
                    hintText: "Start Time",
                  ),
                  const SizedBox(height: 16),

                  CustomTextField(
                    textEditingController: todoController.endTimeController,
                    hintText: "End Time",
                  ),
                  const SizedBox(height: 24),

                  Center(
                    child: CustomButton(
                      text: "Save Changes",
                      textColor: Colors.white,
                      onPressed: () {
                        final updatedTodo = TodoModel(
                          id: todo.id,
                          title: todoController.titleController.text,
                          description:
                              todoController.descriptionController.text,
                          category: todoController.selectedCategory.value,
                          startTime:
                              todoController.startTimeController.text,
                          endTime: todoController.endTimeController.text,
                          isDone: todo.isDone,
                        );

                        todoController.updateTodo(updatedTodo);
                        todoController.clearForm();
                        Get.back();
                        Get.snackbar(
                          "Updated",
                          "Todo '${todo.title}' updated successfully",
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
