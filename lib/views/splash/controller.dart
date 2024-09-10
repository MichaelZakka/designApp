import 'package:design_app/views/auth/binding.dart';
import 'package:design_app/views/auth/index.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    print('object');
    Future.delayed(Duration(seconds: 5), () {
      Get.offAll(AuthPage() , binding: AuthBinding());
    });
    super.onInit();
  }
}
