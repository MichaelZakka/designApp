import 'package:cached_network_image/cached_network_image.dart';
import 'package:design_app/data/constant/constant.dart';
import 'package:design_app/data/models/response/pending_designs_response.dart';
import 'package:design_app/res/colors.dart';
import 'package:design_app/res/images.dart';
import 'package:design_app/res/styles.dart';
import 'package:design_app/views/admin_dashboard/controller.dart';
import 'package:design_app/views/design/designer/binding.dart';
import 'package:design_app/views/design/designer/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DesignRequest extends StatelessWidget {
  const DesignRequest({super.key, required this.design});
  final PendingDesignsResponse design;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminController>(builder: (_) {
      return GestureDetector(
        onTap: () {
          Get.to(() => DesignerDesignPage(design: design),
              binding: DesignerDesignBinding());
        },
        child: Container(
          height: 125.r,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: baseImageUrl + design.image!,
                placeholder: (context, url) => Image.asset(CACHED_DRESS),
                errorWidget: (context, url, error) => Icon(Icons.error),
                fit: BoxFit.cover,
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ' ${design.name}',
                    style: poppins_samll_black,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    ' ${design.designer!.name}',
                    style: poppins_xSamll_grey,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    width: 100.r,
                    child: _.isLoading.value
                        ? CircularProgressIndicator(
                            color: blue,
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 45.r,
                                height: 45.r,
                                decoration: BoxDecoration(
                                    color: green, shape: BoxShape.circle),
                                child: Center(
                                    child: IconButton(
                                  icon: const Icon(
                                    Icons.check,
                                    color: white,
                                  ),
                                  onPressed: () {
                                    _.loadingToggle();
                                    _.acceptDesignRequest(design.id!);
                                    _.designs.remove(design);
                                  },
                                )),
                              ),
                              Container(
                                width: 45.r,
                                height: 45.r,
                                decoration: BoxDecoration(
                                    color: red, shape: BoxShape.circle),
                                child: Center(
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.remove,
                                      color: white,
                                    ),
                                    onPressed: () {
                                      _.loadingToggle();
                                      _.rejectDesignRequest(design.id!);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                  )
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
