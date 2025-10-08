import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/pages/widescreen/home_widescreen.dart';
import '../controllers/todo_controller.dart';
import '../models/todo_model.dart';
import '../pages/add_todo_page.dart';
import '../widgets/todo_card.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final controller = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        controller.updateLayout(constraints);
        return Obx(
          () => controller.isMobile.value ? HomeMobile() : HomeWidescreen(),
        );
      },
    );
  }
}

class HomeMobile extends StatelessWidget {
  HomeMobile({super.key});

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
      body: SafeArea(
        child: Padding(
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

            return ListView.builder(
              itemCount: todoController.todos.length,
              itemBuilder: (context, index) {
                final TodoModel todo = todoController.todos[index];
                return TodoCard(todo: todo);
              },
            );
          }),
        ),
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
