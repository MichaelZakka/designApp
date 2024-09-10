import 'package:design_app/views/auth/controller.dart';
import 'package:get/get.dart';

class AuthBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(AuthController());
  }
}