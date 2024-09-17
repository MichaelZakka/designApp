import 'package:design_app/data/models/body/changepassword_body.dart';
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

  RxBool isLoading = false.obs;

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

  changePasswordRequest(ChangePasswordBody body) async {
    try {
      accountRepo.changePassword(body).then((value) {
        
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

  @override
  void onInit() async {
    username = await AppStorage.getPref('username');
    email = await AppStorage.getPref('email');
    address = await AppStorage.getPref('address');
    mobile = await AppStorage.getPref('mobile');
    super.onInit();
  }
}
