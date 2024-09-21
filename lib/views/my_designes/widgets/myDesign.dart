import 'package:design_app/data/constant/constant.dart';
import 'package:design_app/data/models/response/designerHome_response.dart';
import 'package:design_app/res/styles.dart';
import 'package:design_app/views/my_designes/widgets/myDesign_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyDesignWidget extends StatelessWidget {
  final DesignerHomeResponse product;
  const MyDesignWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Get.to(() => MyDesignPage(design: product,));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.network(
              baseImageUrl + product.image!,
              fit: BoxFit.fill,
              width: 150.r,
            ),
          ),
          Text(
            '${product.name}',
            overflow: TextOverflow.ellipsis,
            style: poppins_xSamll_black,
          ),
          Text(
            '${product.price}',
            style: poppins_xSamll_grey,
          )
        ],
      ),
    );
  }
}
