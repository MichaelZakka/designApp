import 'package:design_app/data/models/response/homepage_response.dart';
import 'package:design_app/data/repository/home_repo.dart';
import 'package:design_app/res/images.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<String> images = [OFFER1, OFFER2, OFFER3];
  HomeRepo homeRepo = HomeRepo();
  RxBool isReady = false.obs;
  List<HomepageResponse> homePageResponse = [];
  RxBool isEmpty = true.obs;

  readyToggle() {
    isReady.toggle();
    update();
  }

  homepageRequest() async {
    try {
      homeRepo.getHomepage().then((value) {
        if (value.status == 'success') {
          print('success');
          readyToggle();
          for (int i = 0; i < value.data.length; i++) {
            if (value.data[i]['designs'].isNotEmpty) {
              homePageResponse.add(HomepageResponse.fromJson(value.data[i]));
            }
          }
          if (homePageResponse.isNotEmpty) {
            isEmpty.value = false;
          }
        }
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() {
    homepageRequest();
    super.onInit();
  }
}
