import 'package:design_app/res/images.dart';
import 'package:design_app/res/styles.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DesignWidget extends StatelessWidget {
  const DesignWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.toNamed('/userdesign');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              DRESS,
            ),
          ),
          Text(
            'Design name',
            overflow: TextOverflow.ellipsis,
            style: poppins_xSamll_black,
          ),
          Text(
            '180\$',
            style: poppins_xSamll_grey,
          )
        ],
      ),
    );
  }
}
