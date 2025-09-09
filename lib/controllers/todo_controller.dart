import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/todo_model.dart';

class TodoController extends GetxController {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final startTimeController = TextEditingController();
  final endTimeController = TextEditingController();
  final RxString selectedCategory = ''.obs;

  var todos = <TodoModel>[].obs;
  var history = <TodoModel>[].obs;

  @override
  void onInit() {
    super.onInit();

    todos.addAll([
      TodoModel(
        title: "Belajar Flutter",
        description: "Kerjain project Todo App",
        category: "Study",
        startTime: "08:40",
        endTime: "10:00",
      ),
      TodoModel(
        title: "Meeting Project",
        description: "Diskusi bareng tim",
        category: "Work",
        startTime: "13:00",
        endTime: "14:00",
      ),
      TodoModel(
        title: "Olahraga",
        description: "Jogging sore di taman",
        category: "Personal",
        startTime: "17:00",
        endTime: "18:00",
      ),
    ]);
  }

  void addTodo(TodoModel todo) {
    todos.add(todo);
  }

  void markAsDone(TodoModel todo) { 
    history.add(todo);
    todos.remove(todo);
  }

  void deleteTodo(TodoModel todo) {
    todos.remove(todo);
  }

  void saveTodo() {
    if (titleController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty &&
        selectedCategory.value.isNotEmpty) {
      todos.add(
        TodoModel(
          title: titleController.text,
          description: descriptionController.text,
          category: selectedCategory.value,
          startTime: startTimeController.text,
          endTime: endTimeController.text,    
        ),
      );

      titleController.clear();
      descriptionController.clear();
      startTimeController.clear();
      endTimeController.clear();
      selectedCategory.value = '';

      Get.back();
    } else {
      Get.snackbar("Error", "Complete all fields");
    }
  }
}
