import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/controllers/todo_controller.dart';
import 'package:todo_list/widgets/widget_textfield.dart';
import 'package:todo_list/widgets/widget_button.dart';

class AddTodoPage extends StatelessWidget {
  AddTodoPage({super.key});

  final TodoController todoController = Get.find<TodoController>();
  final List<String> categories = ['Work', 'Personal', 'Study'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Add Todo",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        backgroundColor: Colors.lightBlueAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                textEditingController: todoController.titleController,
                hintText: "Title",
                prefixIcon: Icons.title,
              ),
              const SizedBox(height: 22),

              // Description
              CustomTextField(
                textEditingController: todoController.descriptionController,
                hintText: "Description",
                maxLines: 3,
                prefixIcon: Icons.description,
              ),
              const SizedBox(height: 16),

              Obx(
                () => DropdownButtonFormField<String>(
                  value: todoController.selectedCategory.value.isEmpty
                      ? null
                      : todoController.selectedCategory.value,
                  decoration: InputDecoration(
                    labelText: "Category",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.blueAccent,
                        width: 1.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.blueAccent,
                        width: 2,
                      ),
                    ),
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
                readOnly: true,
                prefixIcon: Icons.lock_clock,
                onTap: () async {
                  final pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null) {
                    final pickedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (pickedTime != null) {
                      final dateTime = DateTime(
                        pickedDate.year,
                        pickedDate.month,
                        pickedDate.day,
                        pickedTime.hour,
                        pickedTime.minute,
                      );
                      todoController.startTimeController.text =
                          "${dateTime.day}/${dateTime.month}/${dateTime.year} ${pickedTime.format(context)}";
                    }
                  }
                },
              ),
              const SizedBox(height: 16),

              CustomTextField(
                textEditingController: todoController.endTimeController,
                hintText: "End Time",
                readOnly: true,
                prefixIcon: Icons.lock_clock,
                onTap: () async {
                  final pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null) {
                    final pickedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (pickedTime != null) {
                      final dateTime = DateTime(
                        pickedDate.year,
                        pickedDate.month,
                        pickedDate.day,
                        pickedTime.hour,
                        pickedTime.minute,
                      );
                      todoController.endTimeController.text =
                          "${dateTime.day}/${dateTime.month}/${dateTime.year} ${pickedTime.format(context)}";
                    }
                  }
                },
              ),
              const SizedBox(height: 24),

              Center(
                child: CustomButton(
                  text: "Save",
                  textColor: Colors.white,
                  onPressed: () {
                    todoController.saveTodo();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}