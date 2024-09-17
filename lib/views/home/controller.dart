import 'package:design_app/data/models/response/homepage_response.dart';
import 'package:design_app/data/repository/home_repo.dart';
import 'package:design_app/res/images.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class HomeController extends GetxController {
  List<String> images = [OFFER1, OFFER2, OFFER3];
  HomeRepo homeRepo = HomeRepo();
  RxBool isReady = false.obs;
  HomePageResponse homePageResponse = HomePageResponse();
  RxBool isEmpty = true.obs;

  readyToggle(){
    isReady.toggle();
    update();
  }


  homepageRequest() async {
    try {
      homeRepo.getHomepage().then((value) {
        if (value.status == 'success') {
          print('success');
          print(value.data);
          readyToggle();
          homePageResponse = HomePageResponse.fromJson(value.data);
          if(homePageResponse.data!.isNotEmpty){
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
