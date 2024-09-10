import 'package:design_app/views/design/designer/controller.dart';
import 'package:get/get.dart';

class DesignerDesignBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(DesignerDesignController());
  }
}