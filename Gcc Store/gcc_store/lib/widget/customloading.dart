import 'package:flutter/material.dart';
import 'package:gcc/constant/all.dart';
import 'package:lottie/lottie.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(All.laoding),
    );
  }
}
