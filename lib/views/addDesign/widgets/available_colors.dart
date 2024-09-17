import 'package:design_app/data/models/response/color_response.dart';
import 'package:design_app/res/colors.dart';
import 'package:design_app/views/addDesign/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AvailableColors extends StatefulWidget {
  const AvailableColors({super.key, required this.colors});
  final List<ColorResponse> colors;

  @override
  State<AvailableColors> createState() => _AvailableColorsState();
}

class _AvailableColorsState extends State<AvailableColors> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddDesignController>(builder: (_) {
      return Scaffold(
        floatingActionButton: GestureDetector(
          onTap: () {
            for (int i = 0; i < _.availableColors.length; i++) {
              if (_.colorsChecklist[i].value) {
                _.selectedColors.add(_.availableColors[i].id!);
              }
            }
            _.setColorsMap();
            Navigator.pop(context);
          },
          child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(shape: BoxShape.circle, color: blue),
              child: const Icon(
                Icons.check,
                color: white,
                size: 35,
              )),
        ),
        body: Center(
          child: SizedBox(
            width: Get.width * 0.9,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 45,
                mainAxisSpacing: 45,
              ),
              itemCount: _.availableColors.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _.colorsChecklist[index].toggle();
                      print(_.colorsChecklist);
                    });
                  },
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: hexToColor(widget.colors[index].hex!),
                    ),
                    child: _.colorsChecklist[index].value
                        ? const Center(
                            child: Icon(
                              Icons.check,
                              color: white,
                              size: 45,
                            ),
                          )
                        : const SizedBox(),
                  ),
                );
              },
            ),
          ),
        ),
      );
    });
  }

  Color hexToColor(String hexCode) {
    final hexCodeWithoutHash = hexCode.replaceAll('#', '');
    return Color(int.parse('FF$hexCodeWithoutHash', radix: 16));
  }
}
