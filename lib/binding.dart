import 'package:design_app/init_controller/init_controller.dart';
import 'package:get/get.dart';

class InitBinding implements Bindings{
  @override
  void dependencies(){
    Get.put(InitController());
  }

}