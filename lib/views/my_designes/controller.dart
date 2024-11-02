import 'dart:io';

import 'package:design_app/data/models/response/color_response.dart';
import 'package:design_app/data/models/response/design_response.dart';
import 'package:design_app/data/models/response/designerHome_response.dart';
import 'package:design_app/data/models/response/size_response.dart';
import 'package:design_app/data/repository/design_repo.dart';
import 'package:design_app/data/repository/home_repo.dart';
import 'package:design_app/res/colors.dart';
import 'package:design_app/res/styles.dart';
import 'package:design_app/views/addDesign/controller.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class MyDesignesController extends GetxController {
  HomeRepo homeRepo = HomeRepo();
  RxBool isReady = false.obs;
  List<DesignerHomeResponse> designes = [];
  DesignRepo designRepo = DesignRepo();

  DesignResponse design = DesignResponse();

  RxBool isLoading = false.obs;

  loadingToggle() {
    isLoading.toggle();
    update();
  }

  ////////////////////////////////////////

  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController prepareDeadline = TextEditingController();
  TextEditingController price = TextEditingController();

  ////////////////////////////////////////
  AddDesignController addDesignController = Get.put(AddDesignController());

  RxString displatCategory = ''.obs;

  List<String> choosenSizes = [];
  List<bool> designSizesCheckList = [];

  ////////////////////////////////////////

  readyToggle() {
    isReady.toggle();
    update();
  }

  // updateSize(bool value , bool target){
  //   target = value;
  //   update();
  // }

  updateCategory(String category) {
    displatCategory.value = category;
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

  deleteDesignRequest(int id) async {
    designRepo.deleteDesign(id).then((value) {
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

  String pickedImage = '';
  File? image;
  final ImagePicker picker = ImagePicker();
  Future<bool> cameraPermission() async {
    var locationpermission = await Permission.camera.request();
    if (locationpermission.isGranted) {
      return true;
    }
    return false;
  }

  pickImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      pickedImage = pickedFile.path;
      image = File(pickedFile.path);
    }
    print('------');
    print(image);
    update();
  }

  Future<void> pickImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      pickedImage = pickedFile.path;
      image = File(pickedFile.path);
      print(image);
    } else {
      print('No image selected.');
    }
    update();
  }

  getChoosenSizes() {
    for (int i = 0; i < design.sizes!.length; i++) {
      choosenSizes.add(design.sizes![i].size!);
    }
  }

  List<bool> sizesCheckList(List<String> firstList, List<String> secondList) {
    return firstList.map((element) => secondList.contains(element)).toList();
  }

  // editDesignRequest()async{
  // await designRepo.editDesign(body, sizes, colors, image, design.id!).then((value){});
  // }

  //////////////////////////////////////////////////////////////

  List<String> sizeName = [];
  List<SizeResponse> availableSizes = [];
  List<RxBool> sizesChecklist = [];
  List<int> selectedSizes = [];

////////////////////////////////////////

  sizesList(List<dynamic> jsonList) {
    availableSizes =
        jsonList.map((jsonItem) => SizeResponse.fromJson(jsonItem)).toList();
  }

////////////////////////////////////////

  filterSizeResponseByIds(List<SizeResponse> sizeList, List<int> idsToFind) {
    List<SizeResponse> test =
        sizeList.where((size) => idsToFind.contains(size.id)).toList();
    for (int i = 0; i < test.length; i++) {
      sizeName.add(test[i].size!);
    }
    sizeName = sizeName.toSet().toList();
    update();
  }

////////////////////////////////////////

  getSizesRequest() async {
    try {
      designRepo.getSizes().then((value) {
        if (value.status == 'success') {
          sizesList(value.data);
          for (int i = 0; i < availableSizes.length; i++) {
            sizesChecklist.add(false.obs);
          }
        }
      });
    } catch (e) {
      print(e);
    }
  }

////////////////////////////////////////

  setSizesMap() {
    Map<String, dynamic> sizesToSend = {};
    for (int i = 0; i < selectedSizes.length; i++) {
      sizesToSend.addIf(true, "sizes[$i]", '${selectedSizes[i]}');
    }
    print(sizesToSend);
    return sizesToSend;
  }

  int selectedCategory = 0;

  List<String> colorHex = [];
  List<ColorResponse> availableColors = [];
  List<RxBool> colorsChecklist = [];
  List<int> selectedColors = [];

  colorsList(List<dynamic> jsonList) {
    availableColors =
        jsonList.map((jsonItem) => ColorResponse.fromJson(jsonItem)).toList();
  }

  filterColorResponseByIds(List<ColorResponse> colorList, List<int> idsToFind) {
    List<ColorResponse> test =
        colorList.where((color) => idsToFind.contains(color.id)).toList();
    for (int i = 0; i < test.length; i++) {
      colorHex.add(test[i].hex!);
    }
    colorHex = colorHex.toSet().toList();
    update();
  }

  getColorsRequest() async {
    try {
      designRepo.getColors().then((value) {
        if (value.status == 'success') {
          colorsList(value.data);
          for (int i = 0; i < availableColors.length; i++) {
            colorsChecklist.add(false.obs);
          }
        }
      });
    } catch (e) {
      print(e);
    }
  }

  setColorsMap() {
    Map<String, dynamic> colorsToSend = {};
    List<dynamic> finalList = selectedColors.toSet().toList();
    for (int i = 0; i < finalList.length; i++) {
      colorsToSend.addIf(true, "colors[$i]", '${selectedColors[i]}');
    }

    return colorsToSend;
  }
////////////////////////////////////////

  editDesignRequest() async {
    try {
      Map<String, dynamic> sizesToSend = setSizesMap();
      Map<String, dynamic> colorsToSend = setColorsMap();
      print(name.text);
      print(description.text);
      print(prepareDeadline.text);
      print(price.text);
      print(pickedImage);
      designRepo.editDesign({
        'name': name.text,
        'description': description.text,
        'prepare_duration': prepareDeadline.text,
        'price': price.text,
        'category_id':
            selectedCategory == 0 ? '${design.categoryId}' : '$selectedCategory'
      },
          sizesToSend,
          colorsToSend,
          pickedImage == '' ? null : pickedImage,
          design.id!).then((value) {
        print(value.message);
        loadingToggle();
        if (value.status == 'success') {
          validation(value.message, green);
          Get.offAllNamed('/designerHome');
        } else if (value.status == 'error') {
          validation(value.status, red);
        }
      });
    } catch (e) {
      print(e);
    }
  }

  //////////////////////////////////////////////////////////////
  ///
  RxBool loadingRequest = false.obs;

  loadingRequestToggle() {
    loadingRequest.toggle();
    update();
  }

  @override
  void onInit() {
    getSizesRequest();
    getColorsRequest();
    designerHomeRequest();
    super.onInit();
  }
}
