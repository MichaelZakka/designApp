import 'package:design_app/views/orderHistory/controller.dart';
import 'package:get/get.dart';

class OrderHistoryBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(OrderHistoryController());
  }
}