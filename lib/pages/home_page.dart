import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/controllers/todo_controller.dart';
import 'package:todo_list/pages/add_todo_page.dart';
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Today Tasks",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 16),

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

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddTodoPage()); 
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
