import 'package:coldencastle/constant/constant.dart';
import 'package:flutter/material.dart';

class CustomTextFields extends StatelessWidget {
  final TextEditingController controller;
  final String hints;
  final TextInputType textInputType;
final bool readOnly;
  const CustomTextFields(
      {required this.textInputType,
      required this.controller,
      required this.hints,
      required this.readOnly,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 6,
      shadowColor: All.color1,
      borderRadius: BorderRadius.circular(30),
      child: TextField(
        readOnly:readOnly ,
        //  التحكم
        controller: controller,
        style: TextStyle(
            fontSize: All.textfieldsize,
            color: Colors.black,
            fontWeight: FontWeight.bold),
        keyboardType: textInputType,
        textInputAction: TextInputAction.next,
        cursorColor: All.color1,
        decoration: InputDecoration(
          labelText: hints,
          labelStyle: TextStyle(
              fontSize: All.textfieldsize,
              color: All.color1,
              fontWeight: FontWeight.bold),
          hintText: hints,
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        ),
      ),
    );
  }
}
