import 'package:design_app/res/styles.dart';
import 'package:design_app/widgets/appBar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DesignerInfoPage extends StatelessWidget {
  final String email;
  final String mobile;
  const DesignerInfoPage(
      {super.key, required this.mobile, required this.email});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: const CustomAppBar(
            title: 'Designer Info',
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                15.r.verticalSpace,
                ListTile(
                    leading: Icon(
                      Icons.email,
                      size: 30.r,
                    ),
                    title: Text(
                      email,
                      style: poppins_samll_black,
                    )),
                ListTile(
                    leading: Icon(
                      Icons.phone,
                      size: 30.r,
                    ),
                    title: Text(
                      mobile,
                      style: poppins_samll_black,
                    )),
              ],
            ),
          )),
    );
  }
}
