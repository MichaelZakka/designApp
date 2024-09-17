import 'package:design_app/views/about/controller.dart';
import 'package:get/get.dart';

class AboutBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(AboutController());
  }
}