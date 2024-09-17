import 'package:design_app/data/models/response/product_response.dart';
import 'package:design_app/views/home/widgets/design_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDesignesPage extends StatelessWidget {
  const MyDesignesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: Get.width * 0.9,
        child: GridView.builder(
          itemCount: 20,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 45,
              mainAxisSpacing: 45,
              childAspectRatio: 0.7),
          itemBuilder: (context, index) {
            return DesignWidget(
              product: ProductResponse(
                averageRate: 2,
                categoryId: 'Men',
                price: '180.0\$',
                name: 'T-shirt',
                description: 'This is a T-shirt',
              ),
            );
          },
        ),
      ),
    );
  }
}
