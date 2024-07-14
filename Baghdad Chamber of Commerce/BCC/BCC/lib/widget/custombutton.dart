import 'package:coldencastle/constant/constant.dart';
import 'package:coldencastle/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// تصميم زر

class CustomButton extends StatelessWidget {
  final String data;
  final Function()? onTap;
  const CustomButton({required this.data, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // عند ظغط
      onTap: onTap,
      child: Container(
        width: Get.width * .8,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            // الالوان
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [All.color2, All.color1]),
            borderRadius: BorderRadius.circular(20)),
        child: Center(
            child:
                // تصميم نص
                CustomText(
                    color: Colors.white, data: data, size: All.textsize)),
      ),
    );
  }
}
