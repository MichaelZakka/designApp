import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:design_app/data/constant/constant.dart';
import 'package:design_app/data/models/response/design_response.dart';
import 'package:design_app/res/colors.dart';
import 'package:design_app/res/images.dart';
import 'package:design_app/res/styles.dart';
import 'package:design_app/views/addDesign/controller.dart';
import 'package:design_app/views/auth/widgets/auth_textfield.dart';
import 'package:design_app/views/my_designes/controller.dart';
import 'package:design_app/views/my_designes/widgets/update_colors.dart';
import 'package:design_app/views/my_designes/widgets/update_sizes.dart';
import 'package:design_app/widgets/buttons/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EditDesign extends StatelessWidget {
  final DesignResponse design;
  const EditDesign({super.key, required this.design});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyDesignesController>(builder: (_) {
      return GetBuilder<AddDesignController>(builder: (__) {
        return SafeArea(
          child: Scaffold(
            body: Center(
              child: SizedBox(
                width: Get.width * 0.8,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      25.r.verticalSpace,
                      Text(
                        'Provide us your information details please!',
                        textAlign: TextAlign.center,
                        style: poppins_xSamll_black,
                      ),
                      15.r.verticalSpace,
                      AuthTextfield(
                        hint: 'Design name',
                        width: double.infinity,
                        tec: _.name,
                      ),
                      15.r.verticalSpace,
                      AuthTextfield(
                        hint: 'Description',
                        width: double.infinity,
                        tec: _.description,
                      ),
                      15.r.verticalSpace,
                      AuthTextfield(
                        hint: 'Prepare deadline (per days)',
                        width: double.infinity,
                        tec: _.prepareDeadline,
                        textInputType: TextInputType.number,
                      ),
                      15.r.verticalSpace,
                      AuthTextfield(
                        hint: 'Price (per L.S)',
                        width: double.infinity,
                        tec: _.price,
                        textInputType: TextInputType.number,
                      ),
                      15.r.verticalSpace,
                      CustomButton(
                        width: Get.width * 0.4,
                        color: blue,
                        text: _.displatCategory.toString(),
                        textStyle: poppins_xxSamll_white,
                        ontap: () {
                          print(design.id);
                          Get.bottomSheet(BottomSheet(
                            onClosing: () {},
                            builder: (context) {
                              return SizedBox(
                                height: Get.height * 0.6,
                                child: Center(
                                    child: ListView.builder(
                                  itemCount: __.categories.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      title: GestureDetector(
                                        onTap: () {
                                          _.selectedCategory =
                                              __.categories[index].id!;
                                          design.categoryId =
                                              __.categories[index].id!;
                                          _.updateCategory(__
                                              .categories[
                                                  design.categoryId! - 1]
                                              .name!);
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          __.categories[index].name!,
                                          style: poppins_xSamll_black,
                                        ),
                                      ),
                                    );
                                  },
                                )),
                              );
                            },
                          ));
                        },
                      ),
                      15.r.verticalSpace,
                      CustomButton(
                        width: Get.width * 0.4,
                        color: blue,
                        text: 'Available sizes',
                        textStyle: poppins_xxSamll_white,
                        ontap: () {
                          Get.to(() => UpdateSizes(sizes: __.availableSizes));
                        },
                      ),
                      15.r.verticalSpace,
                      CustomButton(
                        width: Get.width * 0.4,
                        color: blue,
                        text: 'Available colors',
                        textStyle: poppins_xxSamll_white,
                        ontap: () {
                          Get.to(
                              () => UpdateColors(colors: __.availableColors));
                        },
                      ),
                      15.r.verticalSpace,
                      CustomButton(
                        color: blue,
                        text: 'Upload picture',
                        textStyle: poppins_xxSamll_white,
                        width: Get.width * 0.4,
                        ontap: () {
                          Get.bottomSheet(BottomSheet(
                            onClosing: () {},
                            builder: (context) {
                              return SizedBox(
                                height: Get.height * 0.2,
                                child: Center(
                                  child: Dialog(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          children: [
                                            IconButton(
                                                onPressed: () {
                                                  _.pickImageFromGallery();
                                                },
                                                icon: const Icon(
                                                  Icons.photo,
                                                  size: 50,
                                                )),
                                            Text(
                                              'Gallery',
                                              style: poppins_xSamll_black_bold,
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            IconButton(
                                                onPressed: () async {
                                                  if (!(await __
                                                      .cameraPermission())) {
                                                    __.cameraPermission();
                                                  } else {
                                                    _.pickImageFromCamera();
                                                  }
                                                },
                                                icon: const Icon(Icons.camera,
                                                    size: 50)),
                                            Text(
                                              'Camera',
                                              style: poppins_xSamll_black_bold,
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ));
                        },
                      ),
                      15.r.verticalSpace,
                      _.pickedImage != ''
                          ? ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                              child: Image.file(File(_.pickedImage)))
                          : ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                              child: CachedNetworkImage(
                                imageUrl: baseImageUrl + design.image!,
                                placeholder: (context, url) =>
                                    Image.asset(CACHED_DRESS),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                                fit: BoxFit.cover,
                              ),
                            ),
                      15.r.verticalSpace,
                      _.isLoading.value
                          ? CircularProgressIndicator(
                              color: blue,
                            )
                          : CustomButton(
                              color: light_pink,
                              text: 'Confirm',
                              textStyle: poppins_xxSamll_white,
                              width: Get.width * 0.4,
                              ontap: () {
                                if (_.name.text == '') {
                                  _.validation(
                                      'Please enter the name of your design',
                                      red);
                                } else if (_.description.text == '') {
                                  _.validation(
                                      "Please enter the describtion of your design",
                                      red);
                                } else if (_.prepareDeadline.text == '') {
                                  _.validation(
                                      "Please enter the prepare deadline of your design",
                                      red);
                                } else {
                                  _.loadingToggle();
                                _.editDesignRequest();

                                }
                              },
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
    });
  }
}
