import 'package:design_app/views/designer_account/controller.dart';
import 'package:get/get.dart';

class DesignerAccountBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(DesignerAccountController());
  }
}