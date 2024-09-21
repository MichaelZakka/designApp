import 'package:design_app/data/models/response/product_response.dart';
import 'package:design_app/views/home/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExploreController extends GetxController {
  HomeController homeController = Get.put(HomeController());
  List<ProductResponse> products = [];
  List<ProductResponse> productsToDisplay = [];
  RxString search = ''.obs;
  TextEditingController searchInput = TextEditingController();

  void filterDesigns(String query) {
    if (query.isEmpty) {
      productsToDisplay.assignAll(products);
    } else {
      productsToDisplay.assignAll(products.where(
        (design) =>
            design.name!.contains(query) ||
            design.description!.contains(query) ||
            design.price!.contains(query),
      ));
    }
    update();
  }

  @override
  void onInit() {
    products = homeController.allProduts;
    productsToDisplay.assignAll(products);
    super.onInit();
  }
}
