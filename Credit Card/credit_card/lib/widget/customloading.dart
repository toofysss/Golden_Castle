import 'package:credit_card/constant/root.dart';
import 'package:flutter/material.dart';

class Customloading extends StatelessWidget {
  const Customloading({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: Root.primary,
    );
  }
}