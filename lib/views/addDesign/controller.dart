import 'dart:io';

import 'package:design_app/data/models/response/category_response.dart';
import 'package:design_app/data/models/response/color_response.dart';
import 'package:design_app/data/models/response/size_response.dart';
import 'package:design_app/data/repository/design_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class AddDesignController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController prepareDeadline = TextEditingController();
  TextEditingController price = TextEditingController();

  ////////////////////////////////////////////////

  String pickedImage = '';
  File? image;

  ////////////////////////////////////////////////

  List<CategoryResponse> categories = [];
  List<SizeResponse> availableSizes = [];
  List<ColorResponse> availableColors = [];

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
      image = File(pickedFile.path);
      print(image);
    } else {
      print('No image selected.');
    }
  }

  // Future<void> pickImageFromCamera() async {
  //   final pickedFile = await picker.pickImage(source: ImageSource.camera);

  //   if (pickedFile != null) {
  //     image = File(pickedFile.path);
  //   } else {
  //     print('No image captured.');
  //   }
  // }
  getCategoriesRequest() async {
    try {
      designRepo.getCategories().then((value) {
        if (value.status == 'success') {
          // categories = CategoryResponse.fromJson(value.data);
          // print(categories);
          categoriesList(value.data);
          print('===============================');
          print('categories');
          // print(categories);
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
          // mapJsonToItemResponseList(value.data , availableSizes);
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
    for (int i = 0; i < selectedColors.length; i++) {
      colorsToSend.addIf(true, "colors[$i]", '${selectedColors[i]}');
    }
    print(colorsToSend);
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
        'category_id': '1',
      }, sizesToSend, colorsToSend , pickedImage).then((value) {
        print(value.message);
        if(value.status =='success'){
          
        }else if(value.status == 'error'){

        }
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() {
    getCategoriesRequest();
    getColorsRequest();
    getSizesRequest();
    super.onInit();
  }
}
