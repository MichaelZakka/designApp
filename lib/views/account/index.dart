import 'package:design_app/res/colors.dart';
import 'package:design_app/res/styles.dart';
import 'package:design_app/views/account/controller.dart';
import 'package:design_app/widgets/buttons/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountController>(
      builder: (_) {
        return SingleChildScrollView(
            child: Center(
          child: SizedBox(
            width: Get.width * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                15.r.verticalSpace,
                Text('Username', style: poppins_samll_black),
                15.r.verticalSpace,
                Text('example@example.com', style: poppins_samll_black),
                15.r.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(
                      text: 'Orders history',
                      color: pink,
                      textStyle: poppins_xSamll_white,
                      width: 175.r,
                    ),
                    CustomButton(
                      text: 'Rating history',
                      color: pink,
                      textStyle: poppins_xSamll_white,
                      width: 175.r,
                    )
                  ],
                ),
                15.r.verticalSpace,
                CustomButton(
                  text: 'Edit Account',
                  color: pink,
                  textStyle: poppins_xSamll_white,
                  width: double.infinity,
                ),
                15.r.verticalSpace,
                CustomButton(
                  text: 'About',
                  color: pink,
                  textStyle: poppins_xSamll_white,
                  width: double.infinity,
                ),
                15.r.verticalSpace,
                CustomButton(
                  text: 'Contact us',
                  color: pink,
                  textStyle: poppins_xSamll_white,
                  width: double.infinity,
                ),
                15.r.verticalSpace,
                CustomButton(
                  text: 'Delete Account',
                  color: pink,
                  textStyle: poppins_xSamll_white,
                  width: double.infinity,
                ),
                15.r.verticalSpace,
                CustomButton(
                  text: 'Change password',
                  color: pink,
                  textStyle: poppins_xSamll_white,
                  width: double.infinity,
                ),
                15.r.verticalSpace,
                CustomButton(
                  text: 'Logout',
                  color: pink,
                  textStyle: poppins_xSamll_white,
                  width: double.infinity,
                  ontap: () {
                    Get.offAllNamed('/auth');
                  },
                ),
              ],
            ),
          ),
        ));
      },
    );
  }
}
