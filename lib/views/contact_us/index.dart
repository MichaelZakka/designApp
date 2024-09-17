import 'package:design_app/res/images.dart';
import 'package:design_app/res/styles.dart';
import 'package:design_app/widgets/appBar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'Contact us',
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              15.r.verticalSpace,
              SvgPicture.asset(
                LOGO,
                width: 150,
              ),
              ListTile(
                  leading: Icon(
                    Icons.email,
                    size: 30.r,
                  ),
                  title: Text(
                    'contact@design.com',
                    style: poppins_samll_black,
                  )),
              ListTile(
                  leading: Icon(
                    Icons.phone,
                    size: 30.r,
                  ),
                  title: Text(
                    '+963 998 88 4455',
                    style: poppins_samll_black,
                  )),
              ListTile(
                  leading: SvgPicture.asset(WEBSITE, width: 30.r),
                  title: Text(
                    'www.fashiondesign.com',
                    style: poppins_samll_black,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
