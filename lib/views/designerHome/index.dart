import 'package:design_app/views/addDesign/index.dart';
import 'package:design_app/views/designerHome/controller.dart';
import 'package:design_app/views/designerHome/widgets/designer_navigation_bar.dart';
import 'package:design_app/views/designer_account/index.dart';
import 'package:design_app/views/my_designes/index.dart';
import 'package:design_app/widgets/appBar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DesignerHomePage extends StatelessWidget {
  const DesignerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DesignerHomeController>(
      builder: (_) {
        return SafeArea(
          child: Scaffold(
            appBar:  CustomAppBar(
              title: '${_.title}',
            ),
            bottomNavigationBar: DesignerNavgigationBar(),
            body: PageView(
              controller: _.pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                MyDesignesPage(),
                AddDesignPage(),
                DesignerAccountPage()
              ],
            ),
          ),
        );
      }
    );
  }
}
