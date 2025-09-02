import 'package:get/get.dart';
import 'package:todo_list/controllers/home_controller.dart';
import 'package:todo_list/controllers/todo_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<TodoController>(() => TodoController());
  }
}
