import 'package:design_app/res/styles.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryDisplay extends StatelessWidget {
  final String category;
  const CategoryDisplay({super.key ,required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        15.r.verticalSpace,
        Text(
          ' $category',
          style: poppins_medium_black,
        ),
        15.r.verticalSpace,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              // const DesignWidget(),
              10.r.horizontalSpace,
              // const DesignWidget(),
              10.r.horizontalSpace,
              // const DesignWidget(),
              10.r.horizontalSpace,
            ],
          ),
        ),
      ],
    );
  }
}
