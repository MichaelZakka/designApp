import 'package:design_app/res/colors.dart';
import 'package:design_app/res/images.dart';
import 'package:design_app/res/styles.dart';
import 'package:design_app/views/design/user/controller.dart';
import 'package:design_app/widgets/appBar/custom_appbar.dart';
import 'package:design_app/widgets/buttons/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UserDesignPage extends StatelessWidget {
  const UserDesignPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserDesignContoller>(builder: (_) {
      return Scaffold(
        appBar: const CustomAppBar(
          title: 'Design Name',
        ),
        body: Center(
          child: SizedBox(
            width: Get.width * 0.9,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    DRESS,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  15.r.verticalSpace,
                  Text(
                    'Designer name',
                    style: poppins_medium_black_bold,
                  ),
                  15.r.verticalSpace,
                  Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                      style: poppins_xSamll_black),
                  15.r.verticalSpace,
                  Align(
                    alignment: Alignment.center,
                    child: PannableRatingBar(
                      rate: _.rating.value,
                      items: List.generate(
                          5,
                          (index) => RatingWidget(
                                selectedColor: Colors.yellowAccent[700]!,
                                unSelectedColor: Colors.grey,
                                child: const Icon(
                                  Icons.star,
                                  size: 48,
                                ),
                              )),
                      onChanged: (value) {
                        _.updateRating(value);
                      },
                    ),
                  ),
                  15.r.verticalSpace,
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: CustomButton(
                      color: pink,
                      text: 'Order now !',
                      textStyle: poppins_samll_white,
                      height: 45,
                      width: 350.r,
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
