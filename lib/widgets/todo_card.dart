import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/todo_model.dart';
import '../controllers/todo_controller.dart';

class TodoCard extends StatelessWidget {
  final TodoModel todo;
  final todoController = Get.find<TodoController>();

  TodoCard({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        todo.title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200, // abu muda bg
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        todo.category,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey, 
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),

                Text(todo.description),
                const SizedBox(height: 4),

                Text(
                  "${todo.startTime} - ${todo.endTime}",
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),

          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'done') {
                final index = todoController.todos.indexOf(todo);
                if (index != -1) {
                  todoController.markAsDone(index);
                }
              } else if (value == 'delete') {
                todoController.deleteTodo(todo);
              }
            },
            itemBuilder: (context) => [
              if (!todo.isDone)
                const PopupMenuItem(value: 'done', child: Text("Mark as Done")),
              const PopupMenuItem(value: 'delete', child: Text("Delete")),
            ],
          ),
        ],
      ),
    );
  }
}
