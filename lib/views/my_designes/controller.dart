import 'package:design_app/data/models/response/designerHome_response.dart';
import 'package:design_app/data/repository/home_repo.dart';
import 'package:get/get.dart';

class MyDesignesController extends GetxController {
  HomeRepo homeRepo = HomeRepo();
  RxBool isReady = false.obs;
  List<DesignerHomeResponse> designes = [];

  readyToggle() {
    isReady.toggle();
    update();
  }

  designerHomeRequest() async {
    try {
      homeRepo.getHomepage().then((value) {
        if (value.status == 'success') {
          if (value.data.isNotEmpty) {
            for (int i = 0; i < value.data.length; i++) {
              designes.add(DesignerHomeResponse.fromJson(value.data[i]));
            }
          }
          readyToggle();
        }
      });
    } catch (e) {
      print(e);
    }
  }

  getDesignRequest() {
    try {
      
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() {
    designerHomeRequest();
    super.onInit();
  }
}
