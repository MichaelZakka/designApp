import 'package:design_app/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthTextfield extends StatelessWidget {
  final String hint;
  final Color? color;
  final double? width;
  final TextInputType? textInputType;
  final TextEditingController? tec;
  const AuthTextfield(
      {super.key,
      required this.hint,
      this.color,
      this.width,
      this.tec,
      this.textInputType});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? Get.width * 0.6,
      height: 45,
      child: TextField(
        keyboardType: textInputType ?? TextInputType.text,
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
  }
}
