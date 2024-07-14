import 'package:coldencastle/constant/constant.dart';
import 'package:flutter/material.dart';

class CustomDalilSetting extends StatelessWidget {
  final TextInputType textInputType;
  final TextEditingController controller;
  final String hints;
  final Widget trailling;
  final Widget traill;
  final bool readOnly;
  final int maxLines;
  const CustomDalilSetting(
      {required this.controller,
      required this.hints,
      required this.textInputType,
      required this.trailling,
      required this.traill,
      required this.readOnly,
      required this.maxLines,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: ListTile(
        title: Material(
          elevation: 6,
          shadowColor: All.color1,
          borderRadius: BorderRadius.circular(20),
          child: ListTile(
            trailing: traill,
            title: TextField(
              readOnly: readOnly,
              maxLines: maxLines,
              //  التحكم
              controller: controller,
              style: TextStyle(
                  fontSize: All.textfieldsize,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              keyboardType: textInputType,
              cursorColor: All.color1,
              decoration: InputDecoration(
                labelText: hints,
                labelStyle: TextStyle(
                    fontSize: All.textfieldsize,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                hintText: hints,
                border: InputBorder.none,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              ),
            ),
          ),
        ),
        trailing: trailling,
      ),
    );
  }
}
