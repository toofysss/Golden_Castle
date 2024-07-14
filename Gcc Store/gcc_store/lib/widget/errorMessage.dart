
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:gcc/constant/all.dart';
import 'package:gcc/constant/color.dart';
import 'package:gcc/widget/customtext.dart';
import 'package:get/get.dart';

class ErrorMessage extends StatelessWidget {
  final String title;
  final String subtitle;
  const ErrorMessage({
    required this.subtitle,
    required this.title,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            decoration: BoxDecoration(
              color: ColorsClass.containercolor.withOpacity(0.72),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  width: 75,
                  height: 75,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(All.splashImage))),
                ),
                Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: CustomText(
                        data: title,
                        size: All.textsize,
                        colors: Colors.white,
                        fontWeight: FontWeight.bold, maxLines: 1,)),
                Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: CustomText(
                        data: subtitle,
                        size: All.textsize,
                        colors: Colors.white,
                        fontWeight: FontWeight.bold, maxLines: 1,)),
                GestureDetector(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.green),
                      child: CustomText(
                          data: "26".tr,
                          size: All.textsize,
                          colors: Colors.white,
                          fontWeight: FontWeight.bold, maxLines: 1,),
                    ),
                    onTap: () {
                      Get.back();
                    })
              ],
            ),
          ),
          Positioned(
              top: 0,
              right: 0,
              child: GestureDetector(
                onTap: () => Get.back(),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.red),
                  child: Center(
                      child: Icon(
                    Icons.close,
                    size: All.iconSize,
                    color: Colors.white,
                  )),
                ),
              ))
        ],
      ),
    );
  }
}
