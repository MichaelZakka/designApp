import 'package:cached_network_image/cached_network_image.dart';
import 'package:design_app/data/constant/constant.dart';
import 'package:design_app/data/models/response/designerHome_response.dart';
import 'package:design_app/res/images.dart';
import 'package:design_app/res/styles.dart';
import 'package:design_app/views/my_designes/binding.dart';
import 'package:design_app/views/my_designes/controller.dart';
import 'package:design_app/views/my_designes/widgets/myDesign_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyDesignWidget extends StatelessWidget {
  final DesignerHomeResponse product;
  const MyDesignWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyDesignesController>(builder: (_) {
      return GestureDetector(
        onTap: () async {
          await _.getDesignRequest(product.id!).then((value) {
            print(value);
            Get.to(() => MyDesignPage(design: value!),
                binding: MyDesignesBinding());
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              // child: Image.network(
              //   baseImageUrl + product.image!,
              //   fit: BoxFit.contain,
              //   width: 150.r,
              // ),
              child: CachedNetworkImage(
                imageUrl: baseImageUrl + product.image!,
                placeholder: (context, url) => Image.asset(CACHED_DRESS),
                errorWidget: (context, url, error) => Icon(Icons.error),
                fit: BoxFit.contain,
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
    });
  }
}
