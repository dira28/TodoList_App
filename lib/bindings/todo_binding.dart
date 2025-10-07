import 'package:get/get.dart';
import 'package:todo_list/controllers/todo_controller.dart';

class TodoBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<TodoController>(() => TodoController());
  }
}
