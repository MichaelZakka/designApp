import 'package:cached_network_image/cached_network_image.dart';
import 'package:design_app/data/constant/constant.dart';
import 'package:design_app/data/models/response/design_response.dart';
import 'package:design_app/res/colors.dart';
import 'package:design_app/res/images.dart';
import 'package:design_app/res/styles.dart';
import 'package:design_app/views/addDesign/controller.dart';
import 'package:design_app/views/my_designes/controller.dart';
import 'package:design_app/views/my_designes/widgets/edit_design.dart';
import 'package:design_app/widgets/buttons/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyDesignPage extends StatelessWidget {
  MyDesignPage({super.key, required this.design});
  final DesignResponse design;
  final AddDesignController addDesignController =
      Get.put(AddDesignController());

  @override
  Widget build(BuildContext context) {
    getSizes() {
      List<String> sizes = [];
      for (int i = 0; i < design.sizes!.length; i++) {
        sizes.add(design.sizes![i].size!);
      }
      return sizes;
    }

    return GetBuilder<MyDesignesController>(builder: (_) {
      return SafeArea(
        child: Scaffold(
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: pink,
                  ),
                  child: Center(
                    child: IconButton(
                      onPressed: () {
                        _.design = design;
                        _.name.text = design.name!;
                        _.description.text = design.description!;
                        _.prepareDeadline.text = design.prepareDuration!;
                        _.price.text = design.price!;
                        _.displatCategory.value = addDesignController
                            .categories[design.categoryId! - 1].name!;
                        // _.designSizesCheckList = _
                            // .sizesCheckList(
                            //     addDesignController.getSizes(), _.choosenSizes)
                            // .obs;
                        print(_.designSizesCheckList);
                        Get.to(() => EditDesign(
                              design: design,
                            ));
                        // _.getSizes(),__.choosenSizes
                      },
                      icon: const Icon(
                        Icons.edit,
                        size: 30,
                        color: white,
                      ),
                    ),
                  )),
              15.r.verticalSpace,
              Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: pink,
                  ),
                  child: Center(
                    child: IconButton(
                      onPressed: () {
                        Get.defaultDialog(
                            confirm: CustomButton(
                              color: pink,
                              text: 'Yes',
                              textStyle: poppins_xSamll_white,
                              ontap: () {
                                _.deleteDesignRequest(design.id!);
                              },
                            ),
                            cancel: CustomButton(
                              color: pink,
                              text: 'No',
                              textStyle: poppins_xSamll_white,
                              ontap: () {
                                Get.back();
                              },
                            ),
                            content: Text(
                              style: poppins_xSamll_black,
                              'Are you sure you want to delete this design ?',
                              textAlign: TextAlign.center,
                            ));
                      },
                      icon: const Icon(
                        Icons.delete,
                        size: 30,
                        color: white,
                      ),
                    ),
                  )),
            ],
          ),
          // endDrawer: ,
          appBar: AppBar(
            backgroundColor: light_pink,
            title: Text(
              '${design.name}',
              style: poppins_medium_black,
            ),
          ),
          body: Center(
            child: SizedBox(
              width: Get.width * 0.9,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image.network(
                    //   baseImageUrl + design.image!,
                    //   width: double.infinity,
                    //   fit: BoxFit.fitHeight,
                    // ),
                    CachedNetworkImage(
                      imageUrl: baseImageUrl + design.image!,
                      placeholder: (context, url) => Image.asset(CACHED_DRESS),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      fit: BoxFit.cover,
                    ),
                    15.r.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Description',
                          style: poppins_medium_black_bold,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellowAccent[700],
                              size: 48,
                            ),
                            Text(
                              design.averageRate.toString(),
                              style: poppins_medium_black,
                            )
                          ],
                        ),
                      ],
                    ),
                    15.r.verticalSpace,
                    Text('${design.description}', style: poppins_xSamll_black),
                    15.r.verticalSpace,
                    Text(
                      'Price',
                      style: poppins_medium_black_bold,
                    ),
                    15.r.verticalSpace,
                    Text('${design.price}', style: poppins_xSamll_black),
                    15.r.verticalSpace,
                    Text(
                      'Prepare Deadline',
                      style: poppins_medium_black_bold,
                    ),
                    15.r.verticalSpace,
                    Text('${design.prepareDuration}',
                        style: poppins_xSamll_black),
                    15.r.verticalSpace,
                    Text(
                      'Created at',
                      style: poppins_medium_black_bold,
                    ),
                    15.r.verticalSpace,
                    Text(
                        '${design.createdAt!.split('T')[0].replaceAll('-', '/')}',
                        style: poppins_xSamll_black),
                    15.r.verticalSpace,
                    Text(
                      'Available Sizes',
                      style: poppins_medium_black_bold,
                    ),
                    15.r.verticalSpace,
                    Text(getSizes().join(' , '), style: poppins_xSamll_black),
                    15.r.verticalSpace,
                    Text(
                      'Available Colors',
                      style: poppins_medium_black_bold,
                    ),
                    15.r.verticalSpace,
                    SizedBox(
                      height: 45,
                      child: GridView.builder(
                        itemCount: design.colors!.length,
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) {
                          return Container(
                            width: 5,
                            height: 5,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _.hexToColor(design.colors![index].hex!),
                            ),
                          );
                        },
                      ),
                    ),
                    15.r.verticalSpace,
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
