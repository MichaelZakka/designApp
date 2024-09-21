import 'package:design_app/data/models/body/changepassword_body.dart';
import 'package:design_app/data/models/body/updateUser_body.dart';
import 'package:design_app/data/models/response/orderHistory_response.dart';
import 'package:design_app/data/repository/account_repo.dart';
import 'package:design_app/data/repository/auth_repo.dart';
import 'package:design_app/init_controller/app_storage.dart';
import 'package:design_app/res/colors.dart';
import 'package:design_app/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class AccountController extends GetxController {
  String username = '';
  String email = '';
  String address = '';
  String mobile = '';
  List<OrderHistoryResponse> orders = [];

  RxBool isLoading = false.obs;

  TextEditingController currentPass = TextEditingController();
  TextEditingController newPass = TextEditingController();
  TextEditingController confirmNewPass = TextEditingController();

  TextEditingController newEmail = TextEditingController();
  TextEditingController newUsername = TextEditingController();
  TextEditingController newAddress = TextEditingController();
  TextEditingController newMobile = TextEditingController();

  loadingToggle() {
    isLoading.toggle();
    update();
  }

  AuthRepo authRepo = AuthRepo();
  AccountRepo accountRepo = AccountRepo();

  logout() async {
    try {
      authRepo.logout().then((value) {
        if (value.status == 'success') {
          loadingToggle();
          Get.offAllNamed('/auth');
        }
      });
    } catch (e) {
      print(e);
    }
  }

  fillData() {
    newEmail = TextEditingController(text: email);
    newUsername = TextEditingController(text: username);
    newAddress = TextEditingController(text: address);
    newMobile = TextEditingController(text: mobile);
  }

  deleteAccountRequest() async {
    try {
      accountRepo.deleteAccount().then((value) {
        print(value);
        if (value.status == 'success') {
          validation(value.message, green);
          loadingToggle();
          Get.offAllNamed('/auth');
        }
      });
    } catch (e) {
      print(e);
    }
  }

  changePasswordRequest() async {
    try {
      accountRepo
          .changePassword(ChangePasswordBody(
              currentPassword: currentPass.text, newPassword: newPass.text))
          .then((value) {
        print(value);
        if (value.status == 'success') {
          validation(value.message, green);
          loadingToggle();
          Get.offAllNamed('/main');
        } else {
          loadingToggle();
          validation('Something went wrong , Please try again', red);
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
        textColor: Colors.white,
        fontSize: xSmall,
        timeInSecForIosWeb: 3);
  }

  updateAccount() async {
    try {
      accountRepo
          .updateAccount(UpdateUseraccountBody(
        name: newUsername.text,
        address: newAddress.text,
        email: newEmail.text,
        mobile: newMobile.text,
      ))
          .then((value) {
        print(value.message);
        if (value.status == 'success') {
          validation(value.message, green);
          Get.offAllNamed('/main');
          AppStorage.savePref('username', value.data['name']);
          AppStorage.savePref('email', value.data['email']);
          AppStorage.savePref('address', value.data['address']);
          AppStorage.savePref('mobile', value.data['mobile']);
        } else {
          validation('Something went wrong , Please try again', red);
        }
      });
    } catch (e) {
      print(e);
    }
  }

  orderHistoryRequest() async {
    try {
      accountRepo.orderHistory().then((value) {
        if (value.status == 'success') {
          print('orderHistory');
          if (value.data["orders"].length > 0) {
            for (int i = 0; i < value.data["orders"].length; i++) {
              print(value.data['orders'].length);
              orders
                  .add(OrderHistoryResponse.fromJson(value.data["orders"][i]));
            }
          }
        }
      });
    } catch (e) {
      print('orderHistoryRequest exception');
    }
  }

  @override
  void onInit() async {
    username = await AppStorage.getPref('username');
    email = await AppStorage.getPref('email');
    address = await AppStorage.getPref('address');
    mobile = await AppStorage.getPref('mobile');
    orderHistoryRequest();
    fillData();
    super.onInit();
  }
}
