import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DesignerDesignController extends GetxController{

  Color hexToColor(String hexCode) {
    final hexCodeWithoutHash = hexCode.replaceAll('#', '');
    return Color(int.parse('FF$hexCodeWithoutHash', radix: 16));
  }
}