import 'package:design_app/views/account/controller.dart';
import 'package:design_app/views/home/controller.dart';
import 'package:design_app/views/main/controller.dart';
import 'package:design_app/views/explore/controller.dart';
import 'package:get/get.dart';

class MainBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(HomeController());
    Get.put(ExploreController());
    Get.put(AccountController());
  }
}