import 'package:design_app/views/admin_dashboard/widgets/design_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AdminController extends GetxController {
  List<Widget> generateChildren(int count) {
    return List<Widget>.generate(count, (index) {
      return Column(
        children: [12.r.verticalSpace, DesignRequest()],
      );
    });
  }
}
