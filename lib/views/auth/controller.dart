import 'package:design_app/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool login = true.obs;

  List<String> groupValue = ['User', 'Designer'];

  RxInt selectedValue = 0.obs;

  void updateValue(int newvalue) {
    selectedValue.value = newvalue;
    update();
  }

  loadingToggle() {
    isLoading.toggle();
    update();
  }

  // loginRequest(String email, String password) async {
  //   try {
  //     final response = await http
  //         .post(Uri.parse(LOGIN), body: {'email': email, 'password': password});
  //     final js = jsonDecode(response.body);
  //     print(js);
  //     if (js != "the user is not exists!") {
  //       loadingToggle();
  //       print(js['token']);
  //       AppStorage.savePref('Username', js['name']);
  //       AppStorage.savePref('token', js['token']);
  //       AppStorage.savePref('email', email);
  //       Get.offAllNamed('/chooseLanguage');
  //       return js;
  //     } else {
  //       loadingToggle();
  //       validation(js, red);
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // signupRequest(String email, String password, String userName) async {
  //   try {
  //     final response = await http.post(Uri.parse(SIGNUP), body: {
  //       'first_name': userName,
  //       'last_name': 'test',
  //       'email': email,
  //       'password': password
  //     });
  //     print(response.body);
  //     final js = jsonDecode(response.body);
  //     if (response.statusCode == 200) {
  //       loadingToggle();
  //       loginRequest(email, password);
  //     } else {
  //       validation(js, red);
  //     }
  //   } catch (e) {
  //     print(e);
  //     validation('$e', red);
  //   }
  // }

  loginToggle() {
    login.toggle();
    update();
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
