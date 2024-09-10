import 'package:design_app/views/auth/widgets/auth_textfield.dart';
import 'package:design_app/views/explore/controller.dart';
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
                AuthTextfield(
                  hint: 'Search',
                  width: Get.width * 0.9,
                ),
                15.r.verticalSpace,
                SizedBox(
                  width: Get.width * 0.9,
                  height: 600.r,
                  child: GridView.builder(
                    itemCount: 20,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 45,
                            mainAxisSpacing: 45,
                            childAspectRatio: 0.7),
                    itemBuilder: (context, index) {
                      return DesignWidget();
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
