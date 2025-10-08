import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/controllers/todo_controller.dart';
import 'package:todo_list/models/todo_model.dart';
import 'package:todo_list/pages/add_todo_page.dart';
import 'package:todo_list/widgets/todo_card.dart';

class HomeWidescreen extends StatelessWidget {
  HomeWidescreen({super.key});

  final todoController = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        elevation: 0,
        title: const Text(
          "Today Tasks",
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(() {
          if (todoController.todos.isEmpty) {
            return const Center(
              child: Text(
                "No tasks yet",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            );
          }

          return GridView.builder(
            itemCount: todoController.todos.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.1,
            ),
            itemBuilder: (context, index) {
              final TodoModel todo = todoController.todos[index];
              return TodoCard(todo: todo);
            },
          );
        }),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade600,
        onPressed: () {
          Get.to(() => AddTodoPage());
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
