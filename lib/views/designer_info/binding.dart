import 'package:design_app/views/designer_info/controller.dart';
import 'package:get/get.dart';

class DesignerInfoBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(DesignerInfoController());
  }
}