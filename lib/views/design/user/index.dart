import 'package:cached_network_image/cached_network_image.dart';
import 'package:design_app/data/constant/constant.dart';
import 'package:design_app/data/models/body/order_body.dart';
import 'package:design_app/data/models/response/design_response.dart';
import 'package:design_app/res/colors.dart';
import 'package:design_app/res/images.dart';
import 'package:design_app/res/styles.dart';
import 'package:design_app/views/design/user/controller.dart';
import 'package:design_app/views/designer_info/binding.dart';
import 'package:design_app/views/designer_info/index.dart';
import 'package:design_app/widgets/appBar/custom_appbar.dart';
import 'package:design_app/widgets/buttons/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UserDesignPage extends StatelessWidget {
  final DesignResponse? product;
  const UserDesignPage({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    getSizes() {
      List<String> sizes = [];
      for (int i = 0; i < product!.sizes!.length; i++) {
        sizes.add(product!.sizes![i].size!);
      }
      return sizes;
    }

    return GetBuilder<UserDesignContoller>(builder: (_) {
      return Scaffold(
        floatingActionButton: GestureDetector(
          onTap: () async {
            await _
                .getDesignerRequest(product!.designerId.toString())
                .then((value) {
              print(value);
              Get.to(() => DesignerInfoPage(designer: value,),
                  binding: DesignerInfoBinding());
            });
          },
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(color: pink, shape: BoxShape.circle),
            child: const Center(
              child: Icon(
                Icons.chat,
                color: white,
              ),
            ),
          ),
        ),
        appBar: const CustomAppBar(
          title: 'Design Details',
        ),
        body: Center(
          child: SizedBox(
            width: Get.width * 0.9,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image.network(
                  //   baseImageUrl + product!.image!,
                  //   width: double.infinity,
                  //   fit: BoxFit.cover,
                  // ),
                  Center(
                    child: CachedNetworkImage(
                      imageUrl: baseImageUrl + product!.image!,
                      placeholder: (context, url) => Image.asset(CACHED_DRESS),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      fit: BoxFit.cover,
                    ),
                  ),
                  15.r.verticalSpace,
                  Text(
                    'Design name',
                    style: poppins_medium_black_bold,
                  ),
                  15.r.verticalSpace,
                  Text(
                    '${product!.name}',
                    style: poppins_samll_black,
                  ),
                  15.r.verticalSpace,
                  Text(
                    'Description',
                    style: poppins_medium_black_bold,
                  ),
                  15.r.verticalSpace,
                  Text('${product!.description}', style: poppins_xSamll_black),
                  15.r.verticalSpace,
                  Text(
                    'Available Sizes',
                    style: poppins_medium_black_bold,
                  ),
                  SizedBox(
                    height: 30,
                    child: GridView.builder(
                      itemCount: product!.sizes!.length,
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.5,
                        crossAxisCount: 1,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            _.updateSizeIndex(index);
                          },
                          child: Container(
                            width: 30,
                            height: 10,
                            decoration: BoxDecoration(
                                border: _.selectedSizeIndex.value == index
                                    ? Border.all(color: black, width: 2)
                                    : Border.all(color: white),
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Text(
                                product!.sizes![index].size!,
                                style: poppins_xSamll_black,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  Text(
                    'Available Colors',
                    style: poppins_medium_black_bold,
                  ),
                  15.r.verticalSpace,
                  SizedBox(
                    height: 45,
                    child: GridView.builder(
                      itemCount: product!.colors!.length,
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            _.updateColorIndex(index);
                          },
                          child: Container(
                            width: 5,
                            height: 5,
                            decoration: BoxDecoration(
                              border: _.selectedColorIndex.value == index
                                  ? Border.all(color: black, width: 2)
                                  : Border.all(color: white),
                              shape: BoxShape.circle,
                              color: _.hexToColor(product!.colors![index].hex!),
                            ),
                            child: _.selectedColorIndex.value == index
                                ? const Icon(
                                    Icons.check,
                                    color: white,
                                  )
                                : const SizedBox(),
                          ),
                        );
                      },
                    ),
                  ),
                  15.r.verticalSpace,
                  SizedBox(
                    width: Get.width * 0.2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellowAccent[700],
                          size: 48,
                        ),
                        Text(
                          product!.averageRate.toString(),
                          style: poppins_samll_black,
                        ),
                      ],
                    ),
                  ),

                  /////////////////////////////////////////////////////////////////

                  15.r.verticalSpace,
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: CustomButton(
                      color: pink,
                      text: 'Order now !',
                      textStyle: poppins_samll_white,
                      height: 45,
                      width: 350.r,
                      ontap: () {
                        Get.defaultDialog(
                            confirm: CustomButton(
                              color: pink,
                              text: 'Yes',
                              textStyle: poppins_xxSamll_white,
                              ontap: () {
                                _.orderRequest(OrderBody(
                                    designId: product!.id.toString(),
                                    colorId: product!
                                        .colors![_.selectedColorIndex.value].id
                                        .toString(),
                                    sizeId: product!
                                        .sizes![_.selectedSizeIndex.value].id
                                        .toString()));
                              },
                            ),
                            content: Text(
                              'Are you sure you want to make an order on this design ?',
                              style: poppins_xSamll_black,
                            ),
                            cancel: CustomButton(
                              color: pink,
                              text: 'No',
                              textStyle: poppins_xxSamll_white,
                              ontap: () {
                                Get.back();
                              },
                            ),
                            contentPadding:
                                const EdgeInsets.only(left: 25, bottom: 15));
                      },
                    ),
                  ),
                  15.r.verticalSpace,
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
