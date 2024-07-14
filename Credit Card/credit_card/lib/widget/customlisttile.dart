import 'package:credit_card/constant/root.dart';
import 'package:credit_card/widget/customtext.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final Color color;
  final IconData iconData;
  final IconData trailing;

  final String data;
  final Function() ontap;
  const CustomListTile(
      {required this.color,
      required this.data,
      required this.iconData,
      required this.trailing,
      required this.ontap,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: ontap,
      splashColor: Colors.transparent,
      leading: Icon(
        iconData,
        size: 25,
        color: color,
      ),
      trailing: Icon(
        trailing,
        size: 20,
        color: color,
      ),
      title: CustomText(
          colors: color,
          data: data,
          fontWeight: FontWeight.w700,
          size: Root.textsize),
    );
  }
}
