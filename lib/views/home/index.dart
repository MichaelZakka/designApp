import 'package:card_swiper/card_swiper.dart';
import 'package:design_app/res/colors.dart';
import 'package:design_app/res/styles.dart';
import 'package:design_app/views/home/controller.dart';
import 'package:design_app/views/home/widgets/category_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (_) {
      return SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250.r,
              color: black,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(
                    _.images[index],
                    fit: BoxFit.fill,
                  );
                },
                itemCount: _.images.length,
                pagination: const SwiperPagination(),
              ),
            ),
            15.r.verticalSpace,
            _.isReady.value
                ? _.isEmpty.value
                    ? Center(
                        child: Column(
                          children: [
                            150.r.verticalSpace,
                            Text(
                              'No Designs to display',
                              style: poppins_samll_black,
                            ),
                          ],
                        ),
                      )
                    : SizedBox(
                        height: Get.height * 0.7,
                        child: ListView.builder(
                          itemCount: _.homePageResponse.length,
                          itemBuilder: (context, index) {
                            return CategoryDisplay(
                                category: _.homePageResponse[index].name!);
                          },
                        ),
                      )
                : Center(
                    child: Column(
                    children: [
                      150.r.verticalSpace,
                      CircularProgressIndicator(
                        color: pink,
                      ),
                    ],
                  )),
            // IconButton(
            //     onPressed: () {
            //       // print(_.homePageResponse[0].data![0]);
            //     },
            //     icon: Icon(Icons.ad_units))
            // const CategoryDisplay(),
            // const CategoryDisplay(),
            // const CategoryDisplay(),
            // 15.r.verticalSpace
          ],
        ),
      );
    });
  }
}
