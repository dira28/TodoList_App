import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/todo_controller.dart';
import '../models/todo_model.dart';
import '../pages/edit_todo_page.dart';

class TodoCard extends StatelessWidget {
  final TodoModel todo;
  final TodoController todoController = Get.find();

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
        if (todo.id != null) {
          todoController.deleteTodoAt(todo.id!);
        }
        Get.back();
        Get.snackbar(
          "Deleted",
          "Task '${todo.title}' has been deleted",
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
    return Dismissible(
      key: Key(todo.id.toString()),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (_) {
        if (todo.id != null) {
          todoController.deleteTodoAt(todo.id!);
        }
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
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(todo.description),
              const SizedBox(height: 4),
              Text(
                "${todo.startTime} - ${todo.endTime}",
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.edit, color: Colors.blue),
                onPressed: () {
                  todoController.fillForm(todo);
                  Get.to(() => EditTodoPage(todo: todo));
                },
              ),
              IconButton(
                icon: const Icon(Icons.check_circle, color: Colors.green),
                onPressed: () {
                  if (todo.id != null) {
                    todoController.markAsDone(todo.id!);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
