import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String data;
  final double size;
  final Color colors;
  final int maxLines;
  final FontWeight fontWeight;
  const CustomText(
      {required this.data,
      required this.size,
      required this.colors,
      required this.maxLines,
      required this.fontWeight,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      maxLines: maxLines,
      style: TextStyle(
          fontSize: size,
          color: colors,
          fontWeight: fontWeight,
          overflow: TextOverflow.ellipsis),
    );
  }
}
