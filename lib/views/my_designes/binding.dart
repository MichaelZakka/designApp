import 'package:design_app/views/my_designes/controller.dart';
import 'package:get/get.dart';

class MyDesignesBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(MyDesignesController());
  }
}