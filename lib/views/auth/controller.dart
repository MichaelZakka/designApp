import 'package:design_app/data/models/body/login_body.dart';
import 'package:design_app/data/models/body/signup_body.dart';
import 'package:design_app/data/repository/auth_repo.dart';
import 'package:design_app/init_controller/app_storage.dart';
import 'package:design_app/init_controller/init_controller.dart';
import 'package:design_app/res/colors.dart';
import 'package:design_app/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  AuthRepo authRepo = AuthRepo();
  RxBool isLoading = false.obs;
  RxBool login = true.obs;
  InitController initController = Get.put(InitController());

  TextEditingController rEmail = TextEditingController();
  TextEditingController rUsername = TextEditingController();
  TextEditingController rPassword = TextEditingController();
  TextEditingController rConfirmPass = TextEditingController();
  TextEditingController rMobileNumber = TextEditingController();
  TextEditingController rAddress = TextEditingController();

  TextEditingController lEmail = TextEditingController();
  TextEditingController lPassword = TextEditingController();

  List<String> groupValue = ['User', 'Designer'];

  RxInt selectedValue = 0.obs;

  signupRequest() async {
    try {
      authRepo
          .signup(SignupBody(
              email: rEmail.text,
              name: rUsername.text,
              password: rPassword.text,
              mobile: rMobileNumber.text,
              isDesigner: '${selectedValue.value}',
              address: rAddress.text))
          .then((value) {
        loadingToggle();
        if (value.status == 'success') {
          loginRequest(LoginBody(email: rEmail.text, password: rPassword.text));
        } else {
          String firstKey = value.message.keys.first;
          print(firstKey);
          validation(value.message[firstKey][0], red);
        }
        print(value.message);
        if (value.status == 'success') {
        } else if (value.status == 'error') {}
        print(value);
        if (value.status == 'success') {
          print(value.data);
          validation(value.message, green);
        }
      });
    } catch (e) {
      print(e);
    }
  }

  loginRequest(LoginBody loginBody) async {
    try {
      authRepo.login(loginBody).then((value) {
        loadingToggle();
        if (value.status == 'success') {
          print('success');
          AppStorage.savePref('token', value.data['token']);
          AppStorage.savePref('username', value.data['user']['name']);
          AppStorage.savePref('email', value.data['user']['email']);
          AppStorage.savePref('address', value.data['user']['address']);
          AppStorage.savePref('mobile', value.data['user']['mobile']);
          initController.token = value.data['token'];
          if (value.data['user']['is_designer'] == 0) {
            Get.offAllNamed('/main');
          }else if(value.data['user']['is_designer'] == 1){
            Get.offAllNamed('/designerHome');
          }
        } else {
          if (value.message == 'Invalid login credentials') {
            validation(value.message, red);
          } else {
            String firstKey = value.message.keys.first;
            print(firstKey);
            validation(value.message[firstKey][0], red);
          }
        }
      });
    } catch (e) {
      print(e);
    }
  }

  void updateValue(int newvalue) {
    selectedValue.value = newvalue;
    update();
  }

  loadingToggle() {
    isLoading.toggle();
    update();
  }

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
