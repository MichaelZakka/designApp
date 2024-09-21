import 'package:design_app/res/styles.dart';
import 'package:design_app/views/my_designes/controller.dart';
import 'package:design_app/views/my_designes/widgets/myDesign.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDesignesPage extends StatelessWidget {
  const MyDesignesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyDesignesController>(builder: (_) {
      return _.designes.isEmpty
          ? Center(
              child: Text(
                'You haven\'t create any designs yet',
                textAlign: TextAlign.center,
                style: poppins_medium_black,
              ),
            )
          : Center(
              child: SizedBox(
                width: Get.width * 0.9,
                height: Get.height,
                child: GridView.builder(
                  itemCount: _.designes.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 45,
                      mainAxisSpacing: 45,
                      childAspectRatio: 0.7),
                  itemBuilder: (context, index) {
                    return MyDesignWidget(product: _.designes[index]);
                  },
                ),
              ),
            );
    });
  }
}
