import 'package:design_app/data/models/response/homepage_response.dart';
import 'package:design_app/res/styles.dart';
import 'package:design_app/views/category/index.dart';
import 'package:design_app/views/home/widgets/design_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CategoryDisplay extends StatelessWidget {
  final HomepageResponse category;
  const CategoryDisplay({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        15.r.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              ' ${category.name}',
              style: poppins_samll_black,
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => CategoryPage(
                      category: category,
                    ));
              },
              child: Text(
                ' See all',
                style: poppins_xSamll_blue_underlined,
              ),
            ),
          ],
        ),
        15.r.verticalSpace,
        SizedBox(
          height: Get.height * 0.3,
          child: GridView.builder(
            itemCount: category.designs!.length,
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 15, childAspectRatio: 1.8, crossAxisCount: 1),
            itemBuilder: (context, index) {
              return DesignWidget(product: category.designs![index]);
            },
          ),
        ),
      ],
    );
  }
}
