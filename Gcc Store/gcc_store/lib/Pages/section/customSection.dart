// ignore_for_file: file_names

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:gcc/constant/all.dart';
import 'package:gcc/constant/color.dart';
import 'package:gcc/constant/section.dart';
import 'package:gcc/widget/customtext.dart';

class CustomSection extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  const CustomSection(
      {required this.title,
      required this.subtitle,
      required this.image,
      super.key});

  @override
  Widget build(BuildContext context) {
    return FlipInX(
      duration: SectionClass.duration,
      child: GestureDetector(
        onTap: () => SectionClass.viewData(),
        child: Container(
          margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: ColorsClass.containercolor),
          child: Center(
            child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CustomText(
                      maxLines: 1,
                      data: title,
                      size: All.textsize,
                      colors: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CustomText(
                      maxLines: 1,
                      data: subtitle,
                      size: All.textsize,
                      colors: Colors.yellow,
                      fontWeight: FontWeight.bold),
                ),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    image,
                    fit: BoxFit.fill,
                    height: 80,
                    width: 70,
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
