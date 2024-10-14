import 'package:cached_network_image/cached_network_image.dart';
import 'package:design_app/data/constant/constant.dart';
import 'package:design_app/data/models/response/orderResponse.dart';
import 'package:design_app/res/colors.dart';
import 'package:design_app/res/images.dart';
import 'package:design_app/res/styles.dart';
import 'package:design_app/views/designerOrders/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderWidget extends StatelessWidget {
  final OrderResponse order;
  const OrderWidget({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DesignerOrderController>(builder: (_) {
      return SizedBox(
        height: 125.r,
        width: Get.width * 0.9,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                imageUrl: baseImageUrl + order.designImage!,
                placeholder: (context, url) => Image.asset(CACHED_DRESS),
                errorWidget: (context, url, error) => Icon(Icons.error),
                fit: BoxFit.cover,
              ),
            ),
            15.r.horizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  ' ${order.designName}',
                  style: poppins_xSamll_black,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  width: 50.r,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        ' ${order.size}',
                        style: poppins_xxSamll_black,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Container(
                        width: 20.r,
                        height: 20.r,
                        decoration: BoxDecoration(
                            color: _.hexToColor(order.color!),
                            shape: BoxShape.circle),
                      )
                    ],
                  ),
                ),
                Text(
                  ' ${order.user!.email}',
                  style: poppins_xxSamll_black,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  width: 100.r,
                  child: _.isLoading.value
                      ? CircularProgressIndicator(
                          color: blue,
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 45.r,
                              height: 45.r,
                              decoration: BoxDecoration(
                                  color: green, shape: BoxShape.circle),
                              child: Center(
                                  child: IconButton(
                                icon: const Icon(
                                  Icons.check,
                                  color: white,
                                ),
                                onPressed: () {
                                  _.loadingToggle();
                                  _.changeOrderStatusRequest(
                                      order.id!.toString(), 'Accepted');
                                  _.orders.remove(order);
                                  // _.acceptDesignRequest(design.id!);
                                  // _.designs.remove(design);
                                },
                              )),
                            ),
                            Container(
                              width: 45.r,
                              height: 45.r,
                              decoration: BoxDecoration(
                                  color: red, shape: BoxShape.circle),
                              child: Center(
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.remove,
                                    color: white,
                                  ),
                                  onPressed: () {
                                    _.loadingToggle();
                                    _.changeOrderStatusRequest(
                                        order.id!.toString(), 'Rejected');
                                    _.orders.remove(order);

                                    // _.rejectDesignRequest(design.id!);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                )
              ],
            )
          ],
        ),
      );
    });
  }
}
