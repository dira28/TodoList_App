import 'package:get/get.dart';
import 'package:todo_list/controllers/auth_controller.dart';

class AuthBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(()=>AuthController());
  }
}