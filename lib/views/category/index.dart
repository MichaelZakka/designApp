import 'package:design_app/data/models/response/homepage_response.dart';
import 'package:design_app/views/home/widgets/design_widget.dart';
import 'package:design_app/widgets/appBar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key, this.category});
  final HomepageResponse? category;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: category!.name,
        ),
        body: Center(
          child: SizedBox(
            width: Get.width * 0.9,
            child: GridView.builder(
              itemCount: category!.designs!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 45,
                  mainAxisSpacing: 45,
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                return DesignWidget(product: category!.designs![index]);
              },
            ),
          ),
        ),
      ),
    );
  }
}
