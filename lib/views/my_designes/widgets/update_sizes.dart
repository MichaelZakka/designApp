import 'package:design_app/data/models/response/size_response.dart';
import 'package:design_app/res/colors.dart';
import 'package:design_app/res/styles.dart';
import 'package:design_app/views/addDesign/controller.dart';
import 'package:design_app/views/my_designes/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateSizes extends StatefulWidget {
  final List<SizeResponse> sizes;
  final bool update;
  const UpdateSizes({super.key, required this.sizes, this.update = false});

  @override
  State<UpdateSizes> createState() => _UpdateSizesState();
}

class _UpdateSizesState extends State<UpdateSizes> {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return GetBuilder<AddDesignController>(
          builder: (__) {
            return GetBuilder<MyDesignesController>(builder: (_) {
              return Scaffold(
                floatingActionButton: GestureDetector(
                  onTap: () {
                    for (int i = 0; i < __.availableSizes.length; i++) {
                      if (_.sizesChecklist[i].value) {
                        _.selectedSizes.add(__.availableSizes[i].id!);
                      }
                    }
                    _.filterSizeResponseByIds(__.availableSizes, _.selectedSizes);
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
                body: ListView.builder(
                  itemCount: __.availableSizes.length,
                  itemBuilder: (context, index) {
                    return CheckboxListTile(
                      activeColor: blue,
                      onChanged: (bool? value) {
                        setState(() {
                          _.sizesChecklist[index].value = value!;
                        });
                      },
                      value: _.sizesChecklist[index].value,
                      title: Text(
                        __.availableSizes[index].size!,
                        style: poppins_xSamll_black,
                      ),
                    );
                  },
                ),
              );
            });
          }
        );
      }
    );
  }
}
