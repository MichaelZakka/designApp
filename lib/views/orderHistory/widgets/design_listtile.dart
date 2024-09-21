import 'package:design_app/data/constant/constant.dart';
import 'package:design_app/data/models/body/reviewDesign_body.dart';
import 'package:design_app/data/models/response/orderHistory_response.dart';
import 'package:design_app/res/colors.dart';
import 'package:design_app/res/styles.dart';
import 'package:design_app/views/orderHistory/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DesignListTile extends StatelessWidget {
  const DesignListTile({super.key, this.order, required this.index});
  final OrderHistoryResponse? order;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderHistoryController>(builder: (_) {
      return Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  baseImageUrl + order!.design!.image!,
                  width: 150,
                  fit: BoxFit.fill,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ' ${order!.design!.name}',
                    style: poppins_samll_black,
                  ),
                  10.r.verticalSpace,
                  Text(
                    ' ${order!.size}',
                    style: poppins_xSamll_grey,
                  ),
                  10.r.verticalSpace,
                  Container(
                    width: 30.r,
                    decoration: BoxDecoration(
                        color: _.hexToColor(order!.color!),
                        shape: BoxShape.circle),
                    height: 30.r,
                  ),
                  10.r.verticalSpace,
                  Text(
                    ' ${order!.price}',
                    style: poppins_xSamll_grey,
                  ),
                  10.r.verticalSpace,
                  Text(
                    ' ${order!.createdAt!.split('T')[0].replaceAll('-', '/')}',
                    style: poppins_xSamll_grey,
                  ),
                  10.r.verticalSpace,
                  GestureDetector(
                    onTap: () {},
                    child: SizedBox(
                      width: Get.width * 0.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PannableRatingBar(
                            rate: _.ratings[index].toDouble(),
                            items: List.generate(
                                6,
                                (index) => RatingWidget(
                                      selectedColor: Colors.yellowAccent[700]!,
                                      unSelectedColor:
                                          index < 5 ? Colors.grey : white,
                                      child: const Icon(
                                        Icons.star,
                                        size: 24,
                                      ),
                                    )),
                            onCompleted: (value) {
                              _.reviewDesignRequest(ReviewDesignBody(
                                  designId: order!.designId.toString(),
                                  rate: value.toString()));
                            },
                            onChanged: (value) {
                              _.updateRating(index, value);
                            },
                          ),
                          Text(
                            _.ratings[index].toString(),
                            style: poppins_xSamll_black,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          10.r.verticalSpace,
          const Divider(
            color: black,
            height: 2,
          ),
          10.r.verticalSpace,
        ],
      );
    });
  }
}
