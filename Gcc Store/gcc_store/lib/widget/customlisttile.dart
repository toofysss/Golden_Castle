import 'package:flutter/material.dart';
import 'package:gcc/constant/all.dart';
import 'package:gcc/constant/color.dart';
import 'package:gcc/constant/language.dart';
import 'package:gcc/widget/customtext.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final IconData iconData;
  const CustomListTile(
      {required this.title, required this.iconData, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: CustomText(
          data: title,
          colors: ColorsClass.textcolorprimart,
          size: 20,
          fontWeight: FontWeight.bold, maxLines: 1,),
      leading: Icon(
        iconData,
        color: ColorsClass.iconcolor,
        size: All.iconSize,
      ),
      trailing: LanguageClass.lang.text == "English"
          ? Icon(
              Icons.arrow_forward_ios_rounded,
              color: ColorsClass.iconcolor,
              size: All.iconSize,
            )
          : Icon(Icons.arrow_back_ios_new,
              color: ColorsClass.iconcolor, size: All.iconSize),
    );
  }
}
