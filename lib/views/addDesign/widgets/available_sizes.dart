import 'package:design_app/data/models/response/size_response.dart';
import 'package:design_app/res/colors.dart';
import 'package:design_app/res/styles.dart';
import 'package:design_app/views/addDesign/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AvailableSizes extends StatefulWidget {
  const AvailableSizes({super.key, required this.sizes});
  final List<SizeResponse> sizes;

  @override
  State<AvailableSizes> createState() => _AvailableSizesState();
}

class _AvailableSizesState extends State<AvailableSizes> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddDesignController>(builder: (_) {
      return Scaffold(
        floatingActionButton: GestureDetector(
          onTap: () {
            for (int i = 0; i < _.availableSizes.length; i++) {
              if (_.sizesChecklist[i].value) {
                _.selectedSizes.add(_.availableSizes[i].id!);
              }
            }
            print(_.setSizesMap());
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
          itemCount: _.availableSizes.length,
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
                _.availableSizes[index].size!,
                style: poppins_xSamll_black,
              ),
            );
          },
        ),
      );
    });
  }
}
