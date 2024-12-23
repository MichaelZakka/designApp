import 'dart:io';

import 'package:design_app/data/models/response/product_response.dart';
import 'package:design_app/res/colors.dart';
import 'package:design_app/res/styles.dart';
import 'package:design_app/views/addDesign/controller.dart';
import 'package:design_app/views/addDesign/widgets/available_colors.dart';
import 'package:design_app/views/addDesign/widgets/available_sizes.dart';
import 'package:design_app/views/auth/widgets/auth_textfield.dart';
import 'package:design_app/widgets/buttons/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DesignDetails extends StatelessWidget {
  final ProductResponse? product;
  const DesignDetails({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddDesignController>(builder: (_) {
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
                      text: _.selectedCategory.value == ''
                          ? 'Choose Category'
                          : _.selectedCategory.value,
                      textStyle: poppins_xxSamll_white,
                      ontap: () {
                        Get.bottomSheet(
                            GetBuilder<AddDesignController>(builder: (_) {
                          return BottomSheet(
                            onClosing: () {},
                            builder: (context) {
                              return SizedBox(
                                height: Get.height * 0.6,
                                child: Center(
                                    child: ListView.builder(
                                  itemCount: _.categories.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      title: GestureDetector(
                                        onTap: () {
                                          _.selectedCategoryId =
                                              _.categories[index].id!;
                                          _.selectedCategory.value =
                                              _.categories[index].name!;
                                          _.updateCategory(
                                              _.categories[index].name!);
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          _.categories[index].name!,
                                          style: poppins_xSamll_black,
                                        ),
                                      ),
                                    );
                                  },
                                )),
                              );
                            },
                          );
                        }));
                        // Get.dialog();
                      },
                    ),
                    15.r.verticalSpace,
                    CustomButton(
                      width: Get.width * 0.4,
                      color: blue,
                      text: 'Available sizes',
                      textStyle: poppins_xxSamll_white,
                      ontap: () {
                        Get.to(() => AvailableSizes(sizes: _.availableSizes));
                      },
                    ),
                    15.r.verticalSpace,
                    // _.selectedSizes.isEmpty
                    //     ? SizedBox()
                    //     : Text(
                    //         _.selectedSizes.join(', '),
                    //         style: poppins_xxSamll_black,
                    //       ),
                    // 15.r.verticalSpace,
                    CustomButton(
                      width: Get.width * 0.4,
                      color: blue,
                      text: 'Available colors',
                      textStyle: poppins_xxSamll_white,
                      ontap: () {
                        Get.to(
                            () => AvailableColors(colors: _.availableColors));
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
                              height: Get.height * 0.3,
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
                                                print(_.image);
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
                                                if (!(await _
                                                    .cameraPermission())) {
                                                  _.cameraPermission();
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
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            child: Image.file(File(_.pickedImage)))
                        : const SizedBox(),
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
                              } else if (_.selectedCategory.value == '') {
                                _.validation(
                                    'Please enter the design category', red);
                              } else if (_.selectedColors.isEmpty) {
                                _.validation(
                                    'Please choose the design available colors',
                                    red);
                              } else if (_.selectedSizes.isEmpty) {
                                _.validation(
                                    'Please choose the design available sizes',
                                    red);
                              } else if (_.pickedImage == '') {
                                _.validation('Please upload an image', red);
                              } else {
                                _.loadingToggle();
                                _.addDesignRequest();
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
  }
}
