import 'package:card_swiper/card_swiper.dart';
import 'package:design_app/data/models/response/homepage_response.dart';
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
            GestureDetector(
              onTap: () {
              },
              child: Container(
                height: 200.r,
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
            ),
            15.r.verticalSpace,
            // _.sortedData.value
            // ? _.sortedDesigns.isNotEmpty
            //     ? SizedBox(
            //         width: Get.width * 0.9,
            //         child: CategoryDisplay(
            //             category: HomepageResponse(
            //                 designs: _.sortedDesigns,
            //                 id: 99,
            //                 name: 'Top Rated')),
            //       )
            //     : const SizedBox()
            // :
            _.loadingSorted.value
                ? Center(
                    child: CircularProgressIndicator(
                      color: blue,
                    ),
                  )
                : _.sortedDesigns.isEmpty
                    ? const SizedBox()
                    : SizedBox(
                        width: Get.width * 0.9,
                        child: CategoryDisplay(
                            category: HomepageResponse(
                                designs: _.sortedDesigns,
                                id: 99,
                                name: 'Top Rated')),
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
                        width: Get.width * 0.9,
                        child: ListView.builder(
                          itemCount: _.homePageResponse.length,
                          itemBuilder: (context, index) {
                            return CategoryDisplay(
                                category: _.homePageResponse[index]);
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
          ],
        ),
      );
    });
  }
}
