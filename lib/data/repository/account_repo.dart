import 'package:design_app/data/constant/constant.dart';
import 'package:design_app/data/http_client/http_client.dart';
import 'package:design_app/data/models/body/changepassword_body.dart';
import 'package:design_app/init_controller/init_controller.dart';
import 'package:get/get.dart';

class AccountRepo {
  InitController initController = Get.put(InitController());
  MyHttpClient http = MyHttpClient();

  deleteAccount() async {
    return await http.deleteRequest(DELETE_ACCOUNT, {}, {
      "Accept": "application/json",
      "Authorization": "Bearer ${initController.token}"
    });
  }

  changePassword(ChangePasswordBody body) async {
    return await http.postRequest(CHANGE_PASSWORD, body.toJson(), {
      "Accept": "application/json",
      "Authorization": "Bearer ${initController.token}"
    });
  }
}
