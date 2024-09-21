import 'package:design_app/data/models/response/design_response.dart';
import 'package:design_app/data/models/response/designerHome_response.dart';
import 'package:design_app/data/repository/design_repo.dart';
import 'package:design_app/data/repository/home_repo.dart';
import 'package:design_app/res/colors.dart';
import 'package:design_app/res/styles.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class MyDesignesController extends GetxController {
  HomeRepo homeRepo = HomeRepo();
  RxBool isReady = false.obs;
  List<DesignerHomeResponse> designes = [];
  DesignRepo designRepo = DesignRepo();

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

  Color hexToColor(String hexCode) {
    final hexCodeWithoutHash = hexCode.replaceAll('#', '');
    return Color(int.parse('FF$hexCodeWithoutHash', radix: 16));
  }

  void validation(String message, Color color) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: color,
        textColor: white,
        fontSize: xSmall,
        timeInSecForIosWeb: 3);
  }

  deleteDesignRequest(int id)async{
    designRepo.deleteDesign(id).then((value){
      validation(value.message, green);
      Get.offAllNamed('/designerHome');
      
    });
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
    designerHomeRequest();
    super.onInit();
  }
}
