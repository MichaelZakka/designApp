import 'package:design_app/views/designerOrders/controller.dart';
import 'package:get/get.dart';

class DesignerOrdersBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(DesignerOrderController());
  }
}