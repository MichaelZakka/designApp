import 'package:design_app/res/colors.dart';
import 'package:design_app/res/styles.dart';
import 'package:design_app/views/admin_dashboard/controller.dart';
import 'package:design_app/views/admin_dashboard/widgets/admin_account.dart';
import 'package:design_app/widgets/appBar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<AdminController>(builder: (_) {
        return Scaffold(
          endDrawer: Drawer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                25.r.verticalSpace,
                ListTile(
                  title: MaterialButton(
                    onPressed: () {
                      Get.to(() => AdminAccountPage());
                      print(_.designs.length);
                    },
                    child: Text(
                      'Account',
                      style: poppins_samll_black,
                    ),
                  ),
                ),
                ListTile(
                  title: MaterialButton(
                    onPressed: () {
                      _.logoutRequest();
                    },
                    child: Text(
                      'Logout',
                      style: poppins_samll_black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          appBar: const CustomAppBar(
            title: 'Admin Dashboard',
          ),
          body: SingleChildScrollView(
            child: Center(
              child: SizedBox(
                  width: Get.width * 0.9,
                  child: _.isDataReady.value
                      ? _.designs.isEmpty
                          ? Center(
                              child: Text(
                                'There is no pending design requests',
                                textAlign: TextAlign.center,
                                style: poppins_medium_black_bold,
                              ),
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Center(
                                    child: Text(
                                  'Design requests',
                                  style: poppins_samll_black,
                                )),
                                Center(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    children:
                                        _.generateChildren(_.designs.length),
                                  ),
                                ),
                              ],
                            )
                      : Center(
                          child: CircularProgressIndicator(
                            color: blue,
                          ),
                        )),
            ),
          ),
        );
      }),
    );
  }
}
