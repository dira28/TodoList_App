import 'package:get/get.dart';

class SplashscreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed('/login');
    });
  }
}
