import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeTitleUI extends StatelessWidget {
  final Function()? onTap;
  final String title;
  const HomeTitleUI({this.onTap, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          child: Text(title, style: Theme.of(context).textTheme.bodyLarge),
        ),
        Visibility(
          visible: onTap != null,
          child: GestureDetector(
            onTap: onTap,
            child: Container(
                margin: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Text("51".tr,
                        style: Theme.of(context).textTheme.bodyMedium),
                    Icon(
                      Icons.arrow_forward,
                      size: Get.width / 14,
                      color: Colors.red,
                    ),
                  ],
                )),
          ),
        )
      ],
    );
  }
}
