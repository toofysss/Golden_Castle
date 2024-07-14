// ignore_for_file: file_names

import 'package:credit_card/constant/root.dart';
import 'package:credit_card/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  final String data;
  final Color color;
  final Function()? onTap;
  const CustomButton({
    required this.color,
    required this.data, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Container(
          width: Get.width *.5,
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: color,
          ),
          child: Center(
            child: CustomText(
                data: data,
                size: Root.textsize,
                colors: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
