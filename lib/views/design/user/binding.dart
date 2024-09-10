import 'package:design_app/views/design/user/controller.dart';
import 'package:get/get.dart';

class UserDesignBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(UserDesignContoller());
  }
} 