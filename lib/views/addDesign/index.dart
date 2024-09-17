import 'package:design_app/res/colors.dart';
import 'package:design_app/res/styles.dart';
import 'package:design_app/views/addDesign/controller.dart';
import 'package:design_app/views/addDesign/widgets/design_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddDesignPage extends StatelessWidget {
  const AddDesignPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<AddDesignController>(builder: (_) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                25.r.verticalSpace,
                Container(
                  width: 75.r,
                  height: 75,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: blue),
                  child: Center(
                    child: IconButton(
                      onPressed: () {
                        Get.to(()=>DesignDetails());
                        // Get.bottomSheet(BottomSheet(
                        //   onClosing: () {},
                        //   builder: (context) {
                        //     return 
                        //   },
                        // ));
                      },
                      icon: const Icon(
                        Icons.add,
                        size: 60,
                      ),
                      color: white,
                    ),
                  ),
                ),
                15.r.verticalSpace,
                SizedBox(
                  width: Get.width * 0.6,
                  child: Text(
                    textAlign: TextAlign.center,
                    'Be a part of our family and add your creative design !',
                    style: poppins_medium_black_bold,
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
