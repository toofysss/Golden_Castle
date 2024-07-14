import 'package:coldencastle/constant/constant.dart';
import 'package:flutter/material.dart';

// تصميم كلمة المرو

class Customtextfieldpass extends StatefulWidget {
  final TextEditingController controller;
  final String hints;
  final IconData iconData;
  const Customtextfieldpass(
      {required this.controller,
      required this.hints,
      required this.iconData,
      super.key});

  @override
  State<Customtextfieldpass> createState() => _CustomtextfieldpassState();
}

class _CustomtextfieldpassState extends State<Customtextfieldpass> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 6,
      shadowColor: All.color1,
      borderRadius: BorderRadius.circular(30),
      child: TextField(
        obscureText: LoginClass.viewpass,
        controller: widget.controller,
        style: TextStyle(
            fontSize: All.textfieldsize,
            color: Colors.black,
            fontWeight: FontWeight.bold),
        keyboardType: TextInputType.emailAddress,
        cursorColor: All.color1,
        decoration: InputDecoration(
          labelText: widget.hints,
          labelStyle: TextStyle(
              fontSize: All.textfieldsize,
              color: All.color1,
              fontWeight: FontWeight.bold),
          hintText: widget.hints,
          prefixIcon: Icon(
            widget.iconData,
            color: All.color1,
          ),
          suffix: GestureDetector(
            child: Icon(
              LoginClass.viewpass ? Icons.visibility_off : Icons.visibility,
              color: All.color1,
            ),
            onTap: () {
              setState(() {
                LoginClass.viewpass = !LoginClass.viewpass;
              });
            },
          ),
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        ),
      ),
    );
  }
}
