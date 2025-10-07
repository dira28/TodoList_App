import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/todo_controller.dart';
import '../models/todo_model.dart';
import '../pages/edit_todo_page.dart';

class TodoCard extends StatelessWidget {
  final TodoModel todo;
  final int index;
  final TodoController todoController = Get.find();

  TodoCard({super.key, required this.todo, required this.index});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(todo.title + index.toString()),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (_) {
        todoController.deleteTodoAt(index);
        Get.snackbar(
          "Deleted",
          "Todo '${todo.title}' deleted",
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ListTile(
          title: Text(
            todo.title,
            style: TextStyle(
              decoration: todo.isDone
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            ),
          ),
          subtitle: Text(todo.description),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.edit, color: Colors.blue),
                onPressed: () {
                  todoController.fillForm(todo);
                  Get.to(() => EditTodoPage(todo: todo, index: index));
                },
              ),

              IconButton(
                icon: const Icon(Icons.check_circle, color: Colors.green),
                onPressed: () {
                  todoController.markAsDone(index);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
