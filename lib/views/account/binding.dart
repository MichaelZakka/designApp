import 'package:design_app/views/account/controller.dart';
import 'package:get/get.dart';

class AccountBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(AccountController());
  }
}