import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/todo_controller.dart';
import '../widgets/widget_textfield.dart';
import '../widgets/widget_button.dart';

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
                      borderSide: const BorderSide(
                        color: Colors.blueAccent,
                        width: 1.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
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
                hintText: "Start Date",
                readOnly: true,
                prefixIcon: Icons.calendar_today,
                onTap: () async {
                  final pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null) {
                    todoController.startTimeController.text =
                        "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                  }
                },
              ),
              const SizedBox(height: 16),

              CustomTextField(
                textEditingController: todoController.endTimeController,
                hintText: "End Date",
                readOnly: true,
                prefixIcon: Icons.calendar_today,
                onTap: () async {
                  final pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null) {
                    todoController.endTimeController.text =
                        "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
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
