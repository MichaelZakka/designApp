import 'package:design_app/data/constant/constant.dart';
import 'package:design_app/data/http_client/http_client.dart';
import 'package:design_app/data/models/body/login_body.dart';
import 'package:design_app/data/models/body/signup_body.dart';
import 'package:design_app/init_controller/init_controller.dart';
import 'package:get/get.dart';

class AuthRepo {
  final MyHttpClient http = MyHttpClient();
  InitController initController = Get.put(InitController());

  signup(SignupBody signupBody) async {
    return await http.postRequest(REGISTER, signupBody.toJson(), BASE_HEADER);
  }

  login(LoginBody loginBody) async {
    return await http.postRequest(LOGIN, loginBody.toJson(), BASE_HEADER);
  }

  logout() async {
    return await http.postRequest(LOGOUT, {}, {
      "Accept": "application/json",
      "Authorization": "Bearer ${initController.token}"
    });
  }

}
