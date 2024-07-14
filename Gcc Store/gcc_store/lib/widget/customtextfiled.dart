import 'package:flutter/material.dart';
import 'package:gcc/constant/color.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final TextInputType textInputType;
  final bool obscureText;
  const CustomTextField(
      {required this.controller,
      required this.hint,
      required this.textInputType,
      required this.obscureText,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: Get.width * 0.9,
        margin: const EdgeInsets.only(top: 18),
        child: Material(
            elevation: 6,
            shadowColor: ColorsClass.iconcolor,
            borderRadius: BorderRadius.circular(10),
            child: ListTile(
              title: TextField(
                obscureText: obscureText,
                //  التحكم
                controller: controller,
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
                keyboardType: textInputType,
                cursorColor: ColorsClass.iconcolor,
                decoration: InputDecoration(
                  labelText: hint,
                  labelStyle: TextStyle(
                      fontSize: 20,
                      color: ColorsClass.iconcolor,
                      fontWeight: FontWeight.bold),
                  hintText: hint,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                ),
              ),
            )),
      ),
    );
  }
}
