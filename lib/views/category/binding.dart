import 'package:design_app/views/category/controller.dart';
import 'package:get/get.dart';

class CategoryBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(CategoryController());
  }
}