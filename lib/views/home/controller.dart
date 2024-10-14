import 'package:design_app/data/models/body/search_body.dart';
import 'package:design_app/data/models/response/design_response.dart';
import 'package:design_app/data/models/response/homepage_response.dart';
import 'package:design_app/data/models/response/product_response.dart';
import 'package:design_app/data/repository/design_repo.dart';
import 'package:design_app/data/repository/home_repo.dart';
import 'package:design_app/res/images.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<String> images = [OFFER1, OFFER2, OFFER3];
  HomeRepo homeRepo = HomeRepo();
  DesignRepo designRepo = DesignRepo();
  RxBool isReady = false.obs;
  List<HomepageResponse> homePageResponse = [];
  RxBool isEmpty = true.obs;
  List<ProductResponse> allProduts = [];
  List<ProductResponse> sortedDesigns = [];

  readyToggle() {
    isReady.toggle();
    update();
  }

  allDesignsRequest() {
    try {
      designRepo
          .search(SearchBody(
              category: '', description: '', name: '', prepareDuration: ''))
          .then((value) {
        print('===========================================');
        print(value);
        if (value.status == 'success') {
          if (value.data.length > 0) {
            for (int i = 0; i < value.data.length; i++) {
              allProduts.add(ProductResponse.fromJson(value.data[i]));
            }
          }
        }
        print('===========================================');
      });
    } catch (e) {
      print(e);
    }
  }

  getSortedDesignsRequest() async {
    try {
      await designRepo.getSortedDesigns().then((value) {
        if (value.status == 'success') {
          sortedDesigns.add(ProductResponse.fromJson(value.data));
        }
      });
    } catch (e) {
      print(e);
    }
  }

  homepageRequest() async {
    try {
      homeRepo.getHomepage().then((value) {
        if (value.status == 'success') {
          readyToggle();
          print(value.data.length);
          for (int i = 0; i < value.data.length; i++) {
            if (value.data[i]['designs'].isNotEmpty) {
              homePageResponse.add(HomepageResponse.fromJson(value.data[i]));
            }
          }
          if (sortedDesigns.isNotEmpty) {
            homePageResponse.add(HomepageResponse(
                name: 'Top Ratings', id: 7, designs: sortedDesigns));
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

  Future<DesignResponse?> getDesignRequest(int id) async {
    try {
      var response = await designRepo.getDesign(id);

      if (response.status == 'success') {
        return DesignResponse.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  @override
  void onInit() {
    homepageRequest();
    allDesignsRequest();
    getSortedDesignsRequest();
    super.onInit();
  }
}
