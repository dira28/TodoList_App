import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/controllers/todo_controller.dart';
import 'package:todo_list/widgets/todo_card.dart';

class HomePage extends StatelessWidget {
  final todoController = Get.find<TodoController>();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Today Tasks",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_forward_ios, size: 18),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              /// List Todo
              Expanded(
                child: Obx(() {
                  if (todoController.todos.isEmpty) {
                    return const Center(child: Text("Belum ada tugas"));
                  }
                  return ListView.builder(
                    itemCount: todoController.todos.length,
                    itemBuilder: (context, index) {
                      final todo = todoController.todos[index];
                      return TodoCard(todo: todo);
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),

      /// Floating Action Button untuk Tambah Todo
    );
  }
}
