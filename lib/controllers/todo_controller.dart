import 'package:get/get.dart';
import '../models/todo_model.dart';

class TodoController extends GetxController {
  var todos = <TodoModel>[].obs;

  void addTodo(TodoModel todo) {
    todos.add(todo);
  }

  void markAsDone(int index) {
    todos[index].isDone = true;
    todos.refresh();
  }
}
