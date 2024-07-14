import 'package:credit_card/constant/layer.dart';
import 'package:credit_card/constant/root.dart';
import 'package:credit_card/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Layer extends StatelessWidget {
  const Layer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 7,
        shadowColor: Root.primary,
        centerTitle: true,
        title: CustomText(
            colors: Root.primary,
            data: "3".tr,
            fontWeight: FontWeight.w700,
            size: Root.headertextsize),
      ),
      backgroundColor: Root.bgprimary,
      body: SafeArea(
          child: GridView.builder(
        itemCount: LayerClass.data.length,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 200,
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 15),
        itemBuilder: (context, index) => GestureDetector(
          onTap: LayerClass.data[index].onTap,
          child: Container(
            margin: const EdgeInsets.all(15),
            width: Get.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      LayerClass.data[index].startcolor,
                      LayerClass.data[index].endcolor
                    ])),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      LayerClass.data[index].icon,
                      size: 40,
                      color: Root.iconcolor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: CustomText(
                        colors: Root.iconcolor,
                        data: LayerClass.data[index].title,
                        fontWeight: FontWeight.bold,
                        size: Root.textsize),
                  ),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
