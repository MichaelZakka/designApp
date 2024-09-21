import 'package:design_app/views/addDesign/controller.dart';
import 'package:design_app/views/designerHome/controller.dart';
import 'package:design_app/views/designer_account/controller.dart';
import 'package:design_app/views/my_designes/controller.dart';
import 'package:get/get.dart';

class DesignerHomeBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(DesignerHomeController());
    Get.put(AddDesignController());
    Get.put(DesignerAccountController());
    Get.put(MyDesignesController());
  }
}