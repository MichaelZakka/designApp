import 'package:cached_network_image/cached_network_image.dart';
import 'package:design_app/data/constant/constant.dart';
import 'package:design_app/data/models/response/pending_designs_response.dart';
import 'package:design_app/res/images.dart';
import 'package:design_app/res/styles.dart';
import 'package:design_app/views/design/designer/controller.dart';
import 'package:design_app/widgets/appBar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DesignerDesignPage extends StatelessWidget {
  const DesignerDesignPage({super.key, this.design});
  final PendingDesignsResponse? design;

  @override
  Widget build(BuildContext context) {
    getSizes() {
      List<String> sizes = [];
      for (int i = 0; i < design!.sizes!.length; i++) {
        sizes.add(design!.sizes![i].size!);
      }
      return sizes;
    }

    return GetBuilder<DesignerDesignController>(builder: (_) {
      return Scaffold(
        appBar: CustomAppBar(
          title: '${design!.name}',
        ),
        body: Center(
          child: SizedBox(
            width: Get.width * 0.9,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CachedNetworkImage(
                imageUrl: baseImageUrl + design!.image!,
                placeholder: (context, url) => Image.asset(CACHED_DRESS),
                errorWidget: (context, url, error) => Icon(Icons.error),
                fit: BoxFit.cover,
              ),
                  Text(
                    'Designer name',
                    style: poppins_medium_black_bold,
                  ),
                  15.r.verticalSpace,
                  Text(
                    '${design!.designer!.name}',
                    style: poppins_xSamll_black,
                  ),
                  15.r.verticalSpace,
                  Text(
                    'Description',
                    style: poppins_medium_black_bold,
                  ),
                  15.r.verticalSpace,
                  Text('${design!.description}', style: poppins_xSamll_black),
                  15.r.verticalSpace,
                  Text(
                    'Category',
                    style: poppins_medium_black_bold,
                  ),
                  15.r.verticalSpace,
                  Text('${design!.category!.name}',
                      style: poppins_xSamll_black),
                  15.r.verticalSpace,
                  Text(
                    'Available Sizes',
                    style: poppins_medium_black_bold,
                  ),
                  Text(
                    getSizes().join(' , '),
                    style: poppins_xSamll_black,
                  ),
                  15.r.verticalSpace,
                  Text(
                    'Available Colors',
                    style: poppins_medium_black_bold,
                  ),
                  15.r.verticalSpace,
                  SizedBox(
                    height: 45,
                    child: GridView.builder(
                      itemCount: design!.colors!.length,
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                          width: 5,
                          height: 5,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _.hexToColor(design!.colors![index].hex!),
                          ),
                        );
                      },
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
