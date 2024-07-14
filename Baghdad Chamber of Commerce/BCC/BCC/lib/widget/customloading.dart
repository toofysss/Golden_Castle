import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

// تصميم الانتظار
class CustomLoading extends StatelessWidget {
  final Color color;
  const CustomLoading({required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: LoadingIndicator(
      indicatorType: Indicator.ballClipRotateMultiple,
      colors: [color],
      strokeWidth: 5,
      backgroundColor: Colors.transparent,
    ) // صورة الانتظار

        );
  }
}
