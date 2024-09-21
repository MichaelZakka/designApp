import 'package:design_app/res/colors.dart';
import 'package:design_app/res/images.dart';
import 'package:design_app/res/styles.dart';
import 'package:design_app/views/auth/controller.dart';
import 'package:design_app/views/auth/widgets/auth_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<AuthController>(builder: (_) {
        return Scaffold(
          backgroundColor: pink,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                15.r.verticalSpace,
                Text(
                  'Fashion Designers Shop',
                  style: poppins_medium_black,
                ),
                15.r.verticalSpace,
                SvgPicture.asset(
                  ICON1,
                  width: 150,
                ),
                15.r.verticalSpace,
                Center(
                  child: AuthWidget(
                    isLoging: _.login.value,
                  ),
                ),
                  15.r.verticalSpace
              ],
            ),
          ),
        );
      }),
    );
  }
}
