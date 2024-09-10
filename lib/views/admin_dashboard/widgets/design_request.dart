import 'package:design_app/res/colors.dart';
import 'package:design_app/res/images.dart';
import 'package:design_app/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DesignRequest extends StatelessWidget {
  const DesignRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.toNamed('/design');
      },
      child: Container(
        height: 125.r,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(DRESS),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ' Design name',
                  style: poppins_samll_black,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  ' Designer name',
                  style: poppins_xSamll_grey,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  width: 100.r,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 45.r,
                        height: 45.r,
                        decoration:  BoxDecoration(
                            color: green, shape: BoxShape.circle),
                        child: const Center(
                          child: Icon(
                            Icons.check,
                            color: white,
                          ),
                        ),
                      ),
                      Container(
                        width: 45.r,
                        height: 45.r,
                        decoration:  BoxDecoration(
                            color: red, shape: BoxShape.circle),
                        child: const Center(
                            child: Icon(
                            Icons.remove,
                            color: white,
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
  }
}
