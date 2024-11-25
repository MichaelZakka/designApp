import 'package:design_app/res/styles.dart';
import 'package:design_app/views/explore/controller.dart';
import 'package:design_app/views/explore/widgets/search_textfield.dart';
import 'package:design_app/views/home/widgets/design_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExploreController>(
      builder: (_) {
        return Center(
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                15.r.verticalSpace,
                SearchTextfield(
                  tec: _.searchInput,
                  hint: 'Search',
                  width: Get.width * 0.9,
                ),
                15.r.verticalSpace,
                SizedBox(
                  width: Get.width * 0.9,
                  height: 600.r,
                  child: _.products.isEmpty
                      ? Center(
                          child: Column(
                            children: [
                              150.r.verticalSpace,
                              Text(
                                'No Designs to display',
                                style: poppins_samll_black,
                              ),
                            ],
                          ),
                        )
                      : GridView.builder(
                          itemCount: _.productsToDisplay.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 45,
                                  mainAxisSpacing: 45,
                                  childAspectRatio: 0.55),
                          itemBuilder: (context, index) {
                            return DesignWidget(product: _.productsToDisplay[index]);
                          },
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
