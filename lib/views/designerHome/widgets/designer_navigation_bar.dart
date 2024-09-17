import 'package:design_app/res/colors.dart';
import 'package:design_app/views/designerHome/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DesignerNavgigationBar extends StatelessWidget {
  const DesignerNavgigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DesignerHomeController>(builder: (_) {
      return Container(
        width: double.infinity,
        height: 60.r,
        color: pink,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () {
                  _.moveBetweenPages(0);
                  _.updateTitle('My designes');
                },
                icon: Icon(Icons.home,
                    color: _.pageIndex.value == 0 ? black : white)),
            IconButton(
                onPressed: () {
                  _.moveBetweenPages(1);
                  _.updateTitle('Add Design');
                },
                icon: Icon(Icons.add,
                    color: _.pageIndex.value == 1 ? black : white)),
            IconButton(
                onPressed: () {
                  _.moveBetweenPages(2);
                  _.updateTitle('Profile');
                },
                icon: Icon(Icons.person,
                    color: _.pageIndex.value == 2 ? black : white)),
          ],
        ),
      );
    });
  }
}
