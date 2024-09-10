import 'package:design_app/res/styles.dart';
import 'package:design_app/views/admin_dashboard/controller.dart';
import 'package:design_app/widgets/appBar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<AdminController>(builder: (_) {
        return Scaffold(
          endDrawer: const Drawer(),
          appBar: const CustomAppBar(
            title: 'Admin Dashboard',
          ),
          body: Center(
            child: SizedBox(
              width: Get.width * 0.9,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Design requests', style: poppins_samll_black),
                    Center(
                      child: SizedBox(
                        child: Column(
                          children: _.generateChildren(45),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
