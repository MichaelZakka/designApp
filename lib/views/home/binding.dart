import 'package:design_app/views/home/controller.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}