import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/todo_controller.dart';
import '../models/todo_model.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});
  final todoController = Get.find<TodoController>();

  void _showDeleteDialog(BuildContext context, int index) {
    Get.defaultDialog(
      title: "Delete History",
      middleText: "Are you sure you want to delete this history?",
      textCancel: "No",
      textConfirm: "Yes",
      confirmTextColor: Colors.white,
      buttonColor: Colors.blueAccent,
      onConfirm: () {
        todoController.deleteTodoAt(todoController.history[index].id!);
        Get.back();
        Get.snackbar(
          "Deleted",
          "History item has been deleted",
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        elevation: 0,
        title: const Text(
          "History",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Obx(() {
            if (todoController.history.isEmpty) {
              return const Center(
                child: Text(
                  "There is no history yet",
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
              );
            }

            return ListView.builder(
              itemCount: todoController.history.length,
              itemBuilder: (context, index) {
                final TodoModel todo = todoController.history[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title + Category + Delete
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              todo.title,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.lineThrough,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
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
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => _showDeleteDialog(context, index),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),

                      // Description
                      Text(
                        todo.description,
                        style: const TextStyle(color: Colors.black87),
                      ),
                      const SizedBox(height: 6),

                      // Start - End Date
                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_today,
                            size: 14,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "${todo.startTime} - ${todo.endTime}",
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          }),
        ),
      ),
    );
  }
}
