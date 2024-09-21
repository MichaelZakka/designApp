import 'package:design_app/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthTextfield extends StatefulWidget {
  const AuthTextfield({
    super.key,
    this.color,
    required this.hint,
    this.width,
    this.textInputType,
    this.tec,
    this.isObsecure = false,
  });
  final String hint;
  final Color? color;
  final double? width;
  final TextInputType? textInputType;
  final TextEditingController? tec;
  final bool isObsecure;

  @override
  State<AuthTextfield> createState() => _AuthTextfieldState();
}

class _AuthTextfieldState extends State<AuthTextfield> {
  bool isVisible = true;

  visibilityToggle() {
    setState(() {
      isVisible = !(isVisible);
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.isObsecure
        ? SizedBox(
            width: widget.width ?? Get.width * 0.6,
            height: 45,
            child: TextField(
              obscureText: isVisible,
              keyboardType: widget.textInputType ?? TextInputType.text,
              controller: widget.tec,
              cursorColor: black,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    visibilityToggle();
                  },
                  icon: Icon(
                    isVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
                hintText: widget.hint,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: widget.color ?? light_pink)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      BorderSide(color: widget.color ?? light_pink, width: 2.0),
                ),
              ),
            ),
          )
        : SizedBox(
            width: widget.width ?? Get.width * 0.6,
            height: 45,
            child: TextField(
              keyboardType: widget.textInputType ?? TextInputType.text,
              controller: widget.tec,
              cursorColor: black,
              decoration: InputDecoration(
                hintText: widget.hint,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: widget.color ?? light_pink)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      BorderSide(color: widget.color ?? light_pink, width: 2.0),
                ),
              ),
            ),
          );
  }
}
