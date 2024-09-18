import 'package:design_app/data/models/body/changepassword_body.dart';
import 'package:design_app/data/models/body/updateUser_body.dart';
import 'package:design_app/data/repository/account_repo.dart';
import 'package:design_app/data/repository/auth_repo.dart';
import 'package:design_app/init_controller/app_storage.dart';
import 'package:design_app/res/colors.dart';
import 'package:design_app/res/styles.dart';
import 'package:design_app/views/admin_dashboard/widgets/design_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class AdminController extends GetxController {
  String username = '';
  String email = '';
  String mobile = '';
  String address = '';

  TextEditingController currentPass = TextEditingController();
  TextEditingController newPass = TextEditingController();
  TextEditingController confirmNewPass = TextEditingController();

  TextEditingController newEmail = TextEditingController();
  TextEditingController newUsername = TextEditingController();
  TextEditingController newAddress = TextEditingController();
  TextEditingController newMobile = TextEditingController();

  AuthRepo authRepo = AuthRepo();
  AccountRepo accountRepo = AccountRepo();

  List<Widget> generateChildren(int count) {
    return List<Widget>.generate(count, (index) {
      return Column(
        children: [12.r.verticalSpace, DesignRequest()],
      );
    });
  }

  logoutRequest() async {
    try {
      authRepo.logout().then((value) {
        Get.offAllNamed('/login');
      });
    } catch (e) {
      print(e);
    }
  }

  changePasswordRequest() async {
    accountRepo
        .changePassword(ChangePasswordBody(
            newPassword: newPass.text, currentPassword: currentPass.text))
        .then((value) {
      if (value.status == 'success') {
        validation('Your password has been changed successfully', green);
        Get.offAllNamed('/admin');
      } else {
        validation('Something went wrong , Please try again', red);
      }
    });
  }

  updateAccountRequest() {
    try {
      accountRepo
          .updateAccount(UpdateUseraccountBody(
              address: newAddress.text,
              email: email,
              name: newUsername.text,
              mobile: newMobile.text))
          .then((value) {
        if (value.status == 'success') {
          validation(value.message, green);
          Get.offAllNamed('/admin');
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
}
