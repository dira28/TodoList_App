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
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        elevation: 0,
        title: const Text(
          "Today Tasks",
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              spreadRadius: 2,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Obx(() {
          if (todoController.todos.isEmpty) {
            return const Center(
              child: Text(
                "Belum ada tugas",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            );
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

      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 45, right: 20),
        child: FloatingActionButton(
          backgroundColor: Colors.blue.shade600,
          onPressed: () {
            Get.to(() => AddTodoPage());
          },
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}
