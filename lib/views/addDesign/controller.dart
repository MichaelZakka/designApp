import 'dart:io';

import 'package:design_app/data/models/response/category_response.dart';
import 'package:design_app/data/models/response/color_response.dart';
import 'package:design_app/data/models/response/size_response.dart';
import 'package:design_app/data/repository/design_repo.dart';
import 'package:design_app/res/colors.dart';
import 'package:design_app/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class AddDesignController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController prepareDeadline = TextEditingController();
  TextEditingController price = TextEditingController();

  ////////////////////////////////////////////////

  RxBool isLoading = false.obs;

  loadingToggle() {
    isLoading.toggle();
    update();
  }

  ////////////////////////////////////////////////

  String pickedImage = '';
  File? image;

  ////////////////////////////////////////////////

  List<String> colorHex = [];
  List<String> sizeName = [];

  List<CategoryResponse> categories = [];
  List<SizeResponse> availableSizes = [];
  List<ColorResponse> availableColors = [];


  // getSizes(){
  //   List<String>sizesSize =[];
  //   for(int i=0 ; i<availableSizes.length;i++){
  //     sizesSize.add(availableSizes[i].size!);
  //   }
  //   return sizesSize;
  // }

  List<RxBool> sizesChecklist = [];
  List<RxBool> colorsChecklist = [];

  RxString selectedCategory = ''.obs;
  int selectedCategoryId = 0;

  List<int> selectedColors = [];
  List<int> selectedSizes = [];

  ////////////////////////////////////////////////

  final ImagePicker picker = ImagePicker();
  DesignRepo designRepo = DesignRepo();

  categoriesList(List<dynamic> jsonList) {
    categories = jsonList
        .map((jsonItem) => CategoryResponse.fromJson(jsonItem))
        .toList();
  }

  sizesList(List<dynamic> jsonList) {
    availableSizes =
        jsonList.map((jsonItem) => SizeResponse.fromJson(jsonItem)).toList();
  }

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

  filterSizeResponseByIds(List<SizeResponse> sizeList, List<int> idsToFind) {
    List<SizeResponse> test =
        sizeList.where((size) => idsToFind.contains(size.id)).toList();
    for (int i = 0; i < test.length; i++) {
      sizeName.add(test[i].size!);
    }
    sizeName = sizeName.toSet().toList();
    update();
  }

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

  getCategoriesRequest() async {
    try {
      designRepo.getCategories().then((value) {
        if (value.status == 'success') {
          categoriesList(value.data);
          print('===============================');
          print('categories');
          print(value.data);
          print('===============================');
        }
      });
    } catch (e) {
      print(e);
    }
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

  checkToggle(int index) {
    sizesChecklist[index].toggle();
  }

  updateCategory(String newCategory) {
    selectedCategory.value = newCategory;
    update();
  }

  setSizesMap() {
    Map<String, dynamic> sizesToSend = {};
    for (int i = 0; i < selectedSizes.length; i++) {
      sizesToSend.addIf(true, "sizes[$i]", '${selectedSizes[i]}');
    }
    print(sizesToSend);
    return sizesToSend;
  }

  setColorsMap() {
    Map<String, dynamic> colorsToSend = {};
    List<dynamic> finalList = selectedColors.toSet().toList();
    for (int i = 0; i < finalList.length; i++) {
      colorsToSend.addIf(true, "colors[$i]", '${selectedColors[i]}');
    }

    return colorsToSend;
  }

  addDesignRequest() async {
    try {
      Map<String, dynamic> sizesToSend = setSizesMap();
      Map<String, dynamic> colorsToSend = setColorsMap();
      designRepo.addDesign({
        'name': name.text,
        'description': description.text,
        'prepare_duration': prepareDeadline.text,
        'price': price.text,
        'category_id': '$selectedCategoryId',
      }, sizesToSend, colorsToSend, pickedImage).then((value) {
        loadingToggle();
        validation(
            'Your request sent successfully pending admin approve', green);
        print(value.message);
        if (value.status == 'success') {
          Get.offAllNamed('/designerHome');
        } else if (value.status == 'error') {
          validation(value.status, red);
        }
      });
    } catch (e) {
      print(e);
    }
  }

  void validation(String message, Color color) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: xSmall,
        timeInSecForIosWeb: 3);
  }

  @override
  void onInit() {
    getCategoriesRequest();
    getColorsRequest();
    getSizesRequest();
    super.onInit();
  }
}
