import 'package:design_app/views/addDesign/controller.dart';
import 'package:get/get.dart';

class AddDesignBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AddDesignController());
  }
}
