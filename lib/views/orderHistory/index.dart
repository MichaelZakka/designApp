import 'package:design_app/res/styles.dart';
import 'package:design_app/views/orderHistory/controller.dart';
import 'package:design_app/views/orderHistory/widgets/design_listtile.dart';
import 'package:design_app/widgets/appBar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderHistoryController>(builder: (_) {
      return SafeArea(
        child: Scaffold(
            appBar: const CustomAppBar(
              title: 'Order history',
            ),
            body: _.orders.isEmpty
                ? Center(
                    child: SizedBox(
                      width: Get.width * 0.8,
                      child: Text(
                        textAlign: TextAlign.center,
                        'You haven\'t order anything yet',
                        style: poppins_medium_black,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: _.orders.length,
                    itemBuilder: (context, index) {
                      return DesignListTile(
                        order: _.orders[index],
                        index: index,
                      );
                    })),
      );
    });
  }
}
