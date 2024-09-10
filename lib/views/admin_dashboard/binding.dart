import 'package:design_app/views/admin_dashboard/controller.dart';
import 'package:get/get.dart';

class AdminBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(AdminController());
  }
}