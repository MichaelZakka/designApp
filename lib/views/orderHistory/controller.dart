import 'package:design_app/data/models/body/reviewDesign_body.dart';
import 'package:design_app/data/models/response/orderHistory_response.dart';
import 'package:design_app/data/repository/design_repo.dart';
import 'package:design_app/res/colors.dart';
import 'package:design_app/res/styles.dart';
import 'package:design_app/views/account/controller.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class OrderHistoryController extends GetxController {
  List<OrderHistoryResponse> orders = [];
  List<RxInt> ratings = [];
  AccountController accountController = Get.put(AccountController());
  DesignRepo designRepo = DesignRepo();

  Color hexToColor(String hexCode) {
    final hexCodeWithoutHash = hexCode.replaceAll('#', '');
    return Color(int.parse('FF$hexCodeWithoutHash', radix: 16));
  }

  assignRatings() {
    for (int i = 0; i < orders.length; i++) {
      ratings.add(orders[i].design!.userRate!.obs);
    }
  }

  updateRating(int index, double rating) {
    ratings[index].value = rating.toInt();
    update();
  }

  void validation(String message, Color color) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: xSmall,
        timeInSecForIosWeb: 3);
  }

  reviewDesignRequest(ReviewDesignBody body) async {
    try {
      designRepo.reviewDesign(body).then((value) {
        if (value.status == 'success') {
          validation(value.message, green);
        } else {
          validation('Something went wrong', red);
        }
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() {
    orders = accountController.orders;
    assignRatings();
    super.onInit();
  }
}
