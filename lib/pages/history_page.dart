import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/pages/widescreen/history_widescreen.dart';
import '../controllers/todo_controller.dart';
import '../models/todo_model.dart';

class HistoryMobile extends StatelessWidget {
  HistoryMobile({super.key});
  final todoController = Get.find<TodoController>();

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
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
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

              return Dismissible(
                key: Key(todo.id.toString()),
                direction: DismissDirection.endToStart,
                background: Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Icon(Icons.delete, color: Colors.white),
                ),

                onDismissed: (_) {
                  todoController.deleteTodoAt(todo.id!);
                  Get.snackbar(
                    "Deleted",
                    "History '${todo.title}' deleted",
                    colorText: Colors.black,
                    snackPosition: SnackPosition.TOP,
                    duration: const Duration(seconds: 1),
                  );
                },

                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  color: Colors.grey[300],
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  elevation: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                          ],
                        ),
                        const SizedBox(height: 6),

                        Text(
                          todo.description,
                          style: const TextStyle(color: Colors.black87),
                        ),
                        const SizedBox(height: 6),

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
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});

  final controller = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        controller.updateLayout(constraints);
        return Obx(
          () =>
              controller.isMobile.value ? HistoryMobile() : HistoryWidescreen(),
        );
      },
    );
  }
}
