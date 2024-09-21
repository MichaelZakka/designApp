import 'package:design_app/data/constant/constant.dart';
import 'package:design_app/data/http_client/http_client.dart';
import 'package:design_app/init_controller/init_controller.dart';
import 'package:get/get.dart';

class AdminRepo {
  MyHttpClient http = MyHttpClient();
  InitController initController = Get.put(InitController());

  getPendingDesigns() async {
    return await http.getRequest(GET_PENDING_REQUESTS, {}, {
      "Accept": "application/json",
      "Authorization": "Bearer ${initController.token}"
    });
  }

  rejectdesign(int id) async {
    return await http.getRequest('$REJECT_DESIGN/$id', {}, {
      "Accept": "application/json",
      "Authorization": "Bearer ${initController.token}"
    });
  }

  acceptDesign(int id) async {
    return await http.getRequest('$ACCEPT_DESIGN/$id', {}, {
      "Accept": "application/json",
      "Authorization": "Bearer ${initController.token}"
    });
  }
}
