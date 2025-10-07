import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/todo_model.dart';
import '../helper/db_helper.dart';

class TodoController extends GetxController {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final startTimeController = TextEditingController();
  final endTimeController = TextEditingController();
  final RxString selectedCategory = ''.obs;

  RxList<TodoModel> todos = <TodoModel>[].obs;
  RxList<TodoModel> history = <TodoModel>[].obs;

  final DBHelper dbHelper = DBHelper();

  @override
  void onInit() {
    super.onInit();
    loadTodos();
  }

  Future<void> loadTodos() async {
    final data = await dbHelper.getTodos();
    todos.assignAll(data.where((t) => !t.isDone).toList());
    history.assignAll(data.where((t) => t.isDone).toList());
  }

  Future<void> saveTodo() async {
    if (titleController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        selectedCategory.value.isEmpty) {
      Get.snackbar(
        "Error",
        "Please fill in all fields",
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
      return;
    }

    final newTodo = TodoModel(
      title: titleController.text,
      description: descriptionController.text,
      category: selectedCategory.value,
      startTime: startTimeController.text,
      endTime: endTimeController.text,
      isDone: false,
    );

    await dbHelper.insertTodo(newTodo);
    clearForm();
    await loadTodos();

    Get.back();
    Get.snackbar(
      "Success",
      "Todo saved successfully",
      colorText: Colors.white,
      backgroundColor: Colors.green,
    );
  }

  Future<void> updateTodo(TodoModel updatedTodo) async {
    if (updatedTodo.id == null) return;
    await dbHelper.updateTodo(updatedTodo.id!, updatedTodo);
    await loadTodos();
    Get.back();
    Get.snackbar(
      "Updated",
      "Todo updated successfully",
      colorText: Colors.white,
      backgroundColor: Colors.blueAccent,
    );
  }

  Future<void> markAsDone(int id) async {
    final allTodos = await dbHelper.getTodos();
    final todo = allTodos.firstWhere((t) => t.id == id);
    todo.isDone = true;

    await dbHelper.updateTodo(id, todo);
    await loadTodos();

    Get.snackbar(
      "Completed",
      "${todo.title} marked as done",
      colorText: Colors.white,
      backgroundColor: Colors.green,
    );
  }

  Future<void> deleteTodoAt(int id) async {
    await dbHelper.deleteTodo(id);
    await loadTodos();
    Get.snackbar(
      "Deleted",
      "Todo deleted successfully",
      colorText: Colors.white,
      backgroundColor: Colors.redAccent,
    );
  }

  void clearForm() {
    titleController.clear();
    descriptionController.clear();
    startTimeController.clear();
    endTimeController.clear();
    selectedCategory.value = '';
  }

  void fillForm(TodoModel todo) {
    titleController.text = todo.title;
    descriptionController.text = todo.description;
    selectedCategory.value = todo.category;
    startTimeController.text = todo.startTime;
    endTimeController.text = todo.endTime;
  }
}
