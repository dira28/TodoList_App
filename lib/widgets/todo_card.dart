import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/todo_model.dart';
import '../controllers/todo_controller.dart';

class TodoCard extends StatelessWidget {
  final TodoModel todo;
  final todoController = Get.find<TodoController>();

  TodoCard({super.key, required this.todo});

  void showDeleteDialog(BuildContext context) {
    Get.defaultDialog(
      title: "Delete Task",
      middleText: "Are you sure you want to delete this Task?",
      textCancel: "No",
      textConfirm: "Yes",
      confirmTextColor: Colors.white,
      buttonColor: Colors.blueAccent,
      onConfirm: () {
        todoController.deleteTodo(todo);
        Get.back();
        Get.snackbar(
          "Deleted",
          "Task item has been deleted",
          colorText: Colors.black,
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 1),
        );
      },
      onCancel: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.blue.shade50, 
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  todo.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  todo.category,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.blue,
                  ),
                ),
              ),
              PopupMenuButton<String>(
                onSelected: (value) {
                  if (value == 'done') {
                    todoController.markAsDone(todo);
                  } else if (value == 'delete') {
                    showDeleteDialog(context);
                  }
                },
                itemBuilder: (context) => [
                  const PopupMenuItem(
                      value: 'done', child: Text("Mark as Done")),
                  const PopupMenuItem(value: 'delete', child: Text("Delete")),
                ],
              ),
            ],
          ),
          const SizedBox(height: 6),

          Text(
            todo.description,
            style: const TextStyle(color: Colors.black87),
          ),
          const SizedBox(height: 6),

          Text(
            "${todo.startTime} - ${todo.endTime}",
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}
