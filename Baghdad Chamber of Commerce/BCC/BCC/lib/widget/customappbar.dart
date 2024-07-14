import 'package:coldencastle/constant/constant.dart';
import 'package:coldencastle/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// تصميم Appbar

class CustomAppBar extends StatelessWidget {
  final Widget actions;
  final Widget leading;
  final String title;
  const CustomAppBar(
      {required this.actions,
      required this.leading,
      required this.title,
      super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      // االحداث
      actions: [actions],
      leading: leading,
      // الالوان
      flexibleSpace: Container(
        height: Get.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [All.color2, All.color1]),
        ),
      ),
      // العنوان
      title:
          // تصميم نص
          CustomText(color: Colors.white, data: title, size: All.textsize),
    );
  }
}
