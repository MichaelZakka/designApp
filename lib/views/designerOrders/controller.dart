import 'package:design_app/data/models/response/orderResponse.dart';
import 'package:design_app/data/repository/design_repo.dart';
import 'package:design_app/res/colors.dart';
import 'package:design_app/res/styles.dart';
import 'package:design_app/views/designerOrders/widgets/order_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class DesignerOrderController extends GetxController {
  DesignRepo designRepo = DesignRepo();
  RxBool isLoading = true.obs;

  List<OrderResponse> orders = [];

  loadingToggle() {
    isLoading.toggle();
    update();
  }

  List<Widget> generateChildren(int count) {
    return List<Widget>.generate(count, (index) {
      return Column(
        children: [
          12.r.verticalSpace,
          OrderWidget(
            order: orders[index],
          )
        ],
      );
    });
  }

  Color hexToColor(String hexCode) {
    final hexCodeWithoutHash = hexCode.replaceAll('#', '');
    return Color(int.parse('FF$hexCodeWithoutHash', radix: 16));
  }

  getOrdersRequest() async {
    try {
      await designRepo.getOrders().then((value) {
        if (value.status == 'success') {
          if (value.data['designs'].length != 0) {
            for (int i = 0; i < value.data['designs'].length; i++) {
              if (value.data['designs'][i]['orders'].isNotEmpty) {
                for (int j = 0;
                    j < value.data['designs'][i]['orders'].length;
                    j++) {
                  if (value.data['designs'][i]['orders'][j]['status'] ==
                      "Pending") {
                    orders.add(OrderResponse.fromJson(
                        value.data['designs'][i]['orders'][j],
                        value.data['designs'][i]['image'],
                        value.data['designs'][i]['name']));
                  }
                }
              }
            }
          }
          loadingToggle();
        }
      });
    } catch (e) {
      print(e);
    }
  }

  changeOrderStatusRequest(String orderId, String status) async {
    try {
      await designRepo.changeOrderStatus(orderId, status).then((value) {
        print(value);
        loadingToggle();
        if (value.status == 'success') {
          validation(value.message, green);
          
        } else {
          validation(value.message, red);
        }
      });
    } catch (e) {
      print(e);
    }
  }

  void validation(String message, Color color) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: color,
        textColor: white,
        fontSize: xSmall,
        timeInSecForIosWeb: 3);
  }

  @override
  void onInit() {
    getOrdersRequest();
    super.onInit();
  }
}
