import 'package:design_app/data/constant/constant.dart';
import 'package:design_app/data/http_client/http_client.dart';
import 'package:design_app/init_controller/init_controller.dart';
import 'package:get/get.dart';

class HomeRepo {
  final MyHttpClient http = MyHttpClient();
  InitController initController = Get.put(InitController());

  getHomepage() async {
    return await http.getRequest(HOMEPAGE, {}, {
      "Accept": "application/json",
      "Authorization": "Bearer ${initController.token}"
    });
  }
}
