import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MainController extends GetxController{
  final pageController = PageController(initialPage: 0);
  RxString title = 'Home'.obs;

  RxInt pageIndex = 0.obs;

  moveBetweenPages(index) {
    pageIndex.value = index;
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 600),
        curve: Curves.fastOutSlowIn);
    update();
  }

  updateTitle(String newTitle){
    title.value = newTitle;
    update();
  }
}
