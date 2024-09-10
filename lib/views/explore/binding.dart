import 'package:design_app/views/explore/controller.dart';
import 'package:get/get.dart';

class ExploreBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(ExploreController());
  }
}