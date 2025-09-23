import 'package:get/route_manager.dart';
import 'package:todo_list/bindings/auth_binding.dart';
import 'package:todo_list/bindings/home_binding.dart';
import 'package:todo_list/bindings/splashscreen_binding.dart';
import 'package:todo_list/bindings/todo_binding.dart';
// import 'package:todo_list/bindings/todo_binding.dart';
import 'package:todo_list/pages/dashboard_page.dart';
import 'package:todo_list/pages/login_page.dart';
import 'package:todo_list/pages/add_todo_page.dart';
import 'package:todo_list/pages/splashscreen_page.dart';
import 'package:todo_list/routes/routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.login,
      page: () => LoginPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.dashboard,
      page: () => DashboardPage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.addTodo,
      page: () => AddTodoPage(),
      binding: TodoBinding(),
    ),
    GetPage(
      name: AppRoutes.splashscreen,
      page: () => SplashscreenPage(),
      binding: SplashscreenBinding(),
    ),
  ];
}
