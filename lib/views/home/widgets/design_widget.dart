import 'package:design_app/data/models/response/product_response.dart';
import 'package:design_app/res/images.dart';
import 'package:design_app/res/styles.dart';
import 'package:design_app/views/design/user/index.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DesignWidget extends StatelessWidget {
  final ProductResponse product;
  const DesignWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(()=> UserDesignPage());
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              DRESS,
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
