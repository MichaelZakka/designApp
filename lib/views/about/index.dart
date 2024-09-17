import 'package:design_app/res/styles.dart';
import 'package:design_app/widgets/appBar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'About',
        ),
        body: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: Get.width * 0.9,
              child: Column(
                children: [
                  15.verticalSpace,
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: 'Welcome to Fashion Design App\n',
                            style: poppins_medium_black_bold),
                        TextSpan(
                            text:
                                'your go-to destination for curated clothing and exclusive designs. Whether you\'re looking for the latest fashion trends, unique custom designs, or timeless wardrobe staples, we\’ve got you covered. \n At Fashion Design App, we aim to merge fashion and creativity by offering a seamless shopping experience. Our platform allows users to discover and purchase a wide range of clothing styles, from casual wear to haute couture, alongside personalized and exclusive design collections.',
                            style: poppins_samll_black),
                      ],
                    ),
                  ),
                  25.r.verticalSpace,
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: 'What We Offer\n',
                            style: poppins_medium_black_bold),
                        TextSpan(
                            text:
                                'Trendy Apparel: Stay ahead with the latest fashion trends and styles.Exclusive Designs: Access one-of-a-kind pieces created by talented designers.Custom Orders: Tailor-made options so you can express your individuality.User-Friendly Experience: Shop with ease, thanks to our intuitive design and interface.Our mission is to empower your sense of style, whether you’re dressing for a special occasion, updating your wardrobe, or seeking out exclusive design collaborations. We believe in offering not just products but an entire experience that reflects your unique taste.Explore, shop, and redefine your style with Fashion Design App. Let’s make fashion personal again',
                            style: poppins_samll_black),
                      ],
                    ),
                  ),
                  25.r.verticalSpace,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
