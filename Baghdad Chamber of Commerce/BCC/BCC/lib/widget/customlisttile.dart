import 'package:flutter/material.dart';
import 'package:get/get.dart';

// تصميم
class CustomListTile extends StatelessWidget {
  final Widget title;
  final Widget leading;
  final Function()? onTap;

  const CustomListTile(
      {required this.title,
      required this.leading,
      required this.onTap,
      super.key});

  @override
  Widget build(BuildContext context) {
    // list tile
    return SizedBox(
      width: Get.width,
      child: ListTile(
          // عند ظغط
          onTap: onTap,
          // العنوان

          title:
              // تصميم نص
              title,
          leading: leading),
    );
  }
}
