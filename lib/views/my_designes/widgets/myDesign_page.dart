import 'package:design_app/data/constant/constant.dart';
import 'package:design_app/data/models/response/designerHome_response.dart';
import 'package:design_app/res/styles.dart';
import 'package:design_app/widgets/appBar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyDesignPage extends StatelessWidget {
  const MyDesignPage({super.key, required this.design});
  final DesignerHomeResponse design;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: '${design.name}',
      ),
      body: Center(
        child: SizedBox(
          width: Get.width * 0.9,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  baseImageUrl + design.image!,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
                15.r.verticalSpace,
                Text(
                  'Description',
                  style: poppins_medium_black_bold,
                ),
                15.r.verticalSpace,
                Text('${design.description}', style: poppins_xSamll_black),
                15.r.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
