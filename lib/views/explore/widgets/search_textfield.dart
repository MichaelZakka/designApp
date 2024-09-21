import 'package:design_app/res/colors.dart';
import 'package:design_app/views/explore/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchTextfield extends StatelessWidget {
  const SearchTextfield({
    super.key,
    this.color,
    required this.hint,
    this.width,
    this.tec,
  });
  final String hint;
  final Color? color;
  final double? width;
  final TextEditingController? tec;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExploreController>(builder: (_) {
      return SizedBox(
        width: width ?? Get.width * 0.6,
        height: 45,
        child: TextField(
          onChanged: (value) {
            _.filterDesigns(tec!.text);
          },
          controller: tec,
          cursorColor: black,
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: color ?? light_pink)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: color ?? light_pink, width: 2.0),
            ),
          ),
        ),
      );
    });
  }
}
