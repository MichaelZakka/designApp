import 'package:design_app/views/account/index.dart';
import 'package:design_app/views/explore/index.dart';
import 'package:design_app/views/home/index.dart';
import 'package:design_app/views/main/controller.dart';
import 'package:design_app/views/main/widgets/navigation_bar.dart';
import 'package:design_app/widgets/appBar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  // final MainController mainController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (_) {
        return SafeArea(
          child: Scaffold(
            appBar:  CustomAppBar(title: _.title.value),
            bottomNavigationBar: const CustomNavgigationBar(),
            body: PageView(
              controller: _.pageController,
              physics: const NeverScrollableScrollPhysics(),
              children:  [
                HomePage(),
                ExplorePage(),
                AccountPage()
              ],
            ),
          ),
        );
      }
    );
  }
}
