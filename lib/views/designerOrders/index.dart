import 'package:design_app/res/colors.dart';
import 'package:design_app/res/styles.dart';
import 'package:design_app/views/designerOrders/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DesignerOrderPage extends StatelessWidget {
  const DesignerOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DesignerOrderController>(builder: (_) {
      return SingleChildScrollView(
        child: Center(
          child: _.isLoading.value
              ? CircularProgressIndicator(
                  color: pink,
                )
              : _.orders.isEmpty
                  ? Center(
                      child: Text(
                        'You don\'t have any orders',
                        style: poppins_medium_black,
                      ),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: _.generateChildren(_.orders.length),
                    ),
        ),
      );
    });
  }
}
