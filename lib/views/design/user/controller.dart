import 'package:design_app/data/models/body/order_body.dart';
import 'package:design_app/data/repository/design_repo.dart';
import 'package:design_app/res/colors.dart';
import 'package:design_app/res/styles.dart';
import 'package:design_app/widgets/buttons/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserDesignContoller extends GetxController {
  RxDouble rating = 0.0.obs;

  RxInt selectedColorIndex = 0.obs;
  RxInt selectedSizeIndex = 0.obs;
  DesignRepo designRepo = DesignRepo();

  updateColorIndex(int index) {
    selectedColorIndex.value = index;
    update();
  }

  updateSizeIndex(int index) {
    selectedSizeIndex.value = index;
    update();
  }

  updateRating(double newRating) {
    rating.value = newRating;
    update();
  }

  Color hexToColor(String hexCode) {
    final hexCodeWithoutHash = hexCode.replaceAll('#', '');
    return Color(int.parse('FF$hexCodeWithoutHash', radix: 16));
  }

  orderRequest(OrderBody body) {
    Get.back();
    try {
      designRepo.makeOrder(body).then((value) {
        if (value.status == 'success') {
          Get.defaultDialog(
            confirm: CustomButton(
              color: pink,
              text: 'Ok',
              textStyle: poppins_xxSamll_white,
              ontap: () {
                Get.offAllNamed('/main');
              },
            ),
            content: Text(
              'Thank you , ${value.message} and We will call you when order is ready to deliver !',
              style: poppins_samll_black,
            ),
            title: value.status,
          );
        }
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
