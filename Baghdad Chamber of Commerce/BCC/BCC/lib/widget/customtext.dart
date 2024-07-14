import 'package:flutter/material.dart';

// تصميم نص

class CustomText extends StatelessWidget {
  final String data;
  final double size;
  final Color color;
  const CustomText(
      {required this.color, required this.data, required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style:
          TextStyle(fontSize: size, fontWeight: FontWeight.bold, color: color),
    );
  }
}
