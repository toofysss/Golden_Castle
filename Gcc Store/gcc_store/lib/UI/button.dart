import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonDesign extends StatelessWidget {
  final String data;
  final Function()? onTap;
  const ButtonDesign({required this.data, required this.onTap, super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.secondary,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Icon(
          Icons.abc,
          size: Get.width / 18,
          color: Colors.white,
        ),
      ),
    );
  }
}

class ButtonIconDesign extends StatelessWidget {
  final IconData iconData;
  final Function()? onTap;
  const ButtonIconDesign(
      {required this.iconData, required this.onTap, super.key});
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (Rect bounds) => LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Theme.of(context).colorScheme.primary,
          Theme.of(context).colorScheme.secondary,
        ],
      ).createShader(bounds),
      child: Icon(
        iconData,
        size: Get.width / 13,
      ),
    );
  }
}
