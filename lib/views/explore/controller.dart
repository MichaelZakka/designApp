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

  Map<int, String> categoryName = {
    1: "Men's Clothing",
    2: "Women's Clothing",
    3: "Bags",
    4: "Kid's Clothing",
    5: "Hats",
    6: "Accessories",
  };

  Map<String, int> categoryIds = {
    "Men's Clothing": 1,
    "Women's Clothing": 2,
    "Bags": 3,
    "Kid's Clothing": 4,
    "Hats": 5,
    "Accessories": 6,
  };
  Map<String, int> categoryIdsLowercase = {
    "men's clothing": 1,
    "women's clothing": 2,
    "bags": 3,
    "kid's clothing": 4,
    "hats": 5,
    "accessories": 6,
  };

  void filterDesigns(String query) {
    if (query.isEmpty) {
      productsToDisplay.assignAll(products);
    } else {
      productsToDisplay.assignAll(products.where((design) =>
          design.name!.contains(query) ||
          design.description!.contains(query) ||
          design.price!.contains(query) ||
          (int.parse(design.price!) - int.parse(query)) < 200 ||
          (int.parse(query) - int.parse(design.price!)) < 200 ||
          design.categoryId == categoryIds[query] ||
          design.categoryId == categoryIdsLowercase[query]));
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
