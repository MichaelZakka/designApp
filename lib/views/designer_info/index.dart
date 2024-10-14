import 'package:cached_network_image/cached_network_image.dart';
import 'package:design_app/data/constant/constant.dart';
import 'package:design_app/data/models/response/designerResponse.dart';
import 'package:design_app/res/images.dart';
import 'package:design_app/res/styles.dart';
import 'package:design_app/widgets/appBar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DesignerInfoPage extends StatelessWidget {
  final DesignerResponse designer;
  const DesignerInfoPage({super.key, required this.designer});

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
                      designer.email!,
                      style: poppins_samll_black,
                    )),
                ListTile(
                    leading: Icon(
                      Icons.phone,
                      size: 30.r,
                    ),
                    title: Text(
                      designer.mobile!,
                      style: poppins_samll_black,
                    )),
                25.r.verticalSpace,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "    Designes",
                    style: poppins_xSamll_black,
                  ),
                ),
                25.r.verticalSpace,
                SizedBox(
                  width: Get.width * 0.9,
                  height: Get.height * 0.4,
                  child: GridView.builder(
                    itemCount: designer.designs!.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: CachedNetworkImage(
                          imageUrl: baseImageUrl + designer.designs![0].image!,
                          placeholder: (context, url) =>
                              Image.asset(CACHED_DRESS),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          )),
    );
  }
}
