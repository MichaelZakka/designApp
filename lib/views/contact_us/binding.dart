import 'package:design_app/views/contact_us/controller.dart';
import 'package:get/get.dart';

class ContactUsBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(ContactUsController());
  }
}