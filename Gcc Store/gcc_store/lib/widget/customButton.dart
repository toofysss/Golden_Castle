// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:gcc/constant/all.dart';
import 'package:gcc/widget/customtext.dart';

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
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: color,
          ),
          child: CustomText(
              data: data,
              size: All.textsize,
              colors: Colors.white,
              fontWeight: FontWeight.bold, maxLines: 1,),
        ),
      ),
    );
  }
}
