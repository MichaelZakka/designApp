import 'package:cached_network_image/cached_network_image.dart';
import 'package:design_app/data/constant/constant.dart';
import 'package:design_app/data/models/response/product_response.dart';
import 'package:design_app/res/images.dart';
import 'package:design_app/res/styles.dart';
import 'package:design_app/views/design/user/binding.dart';
import 'package:design_app/views/design/user/controller.dart';
import 'package:design_app/views/design/user/index.dart';
import 'package:design_app/views/home/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DesignWidget extends StatelessWidget {
  final ProductResponse product;
  const DesignWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (_) {
      return GestureDetector(
        onTap: () async {
          await _.getDesignRequest(product.id!).then((value) {
            UserDesignContoller userDesignContoller =
                Get.put(UserDesignContoller());
            userDesignContoller.rating = value!.isReviewed!
                ? value.userRate!.toDouble().obs
                : 0.toDouble().obs;
            Get.to(
                () => UserDesignPage(
                      product: value,
                    ),
                binding: UserDesignBinding());
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: CachedNetworkImage(
                width: 150.r,
                imageUrl: baseImageUrl + product.image!,
                placeholder: (context, url) => Image.asset(CACHED_DRESS),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.cover,
              ),
              // child: Image.network(
              //   // DRESS,
              //   baseImageUrl + product.image!,
              //   fit: BoxFit.fill,
              //   width: 150.r,
              // ),
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
