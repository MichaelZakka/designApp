import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class UserDesignContoller extends GetxController {
  RxDouble rating = 0.0.obs;

  updateRating(double newRating){
    rating.value = newRating;
    update();
  }
}
