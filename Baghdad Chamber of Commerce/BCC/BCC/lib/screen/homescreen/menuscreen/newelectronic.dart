import 'package:coldencastle/constant/constant.dart';
import 'package:coldencastle/screen/electronictransactions/new/information2.dart';
import 'package:coldencastle/screen/electronictransactions/new/information3.dart';
import 'package:coldencastle/screen/electronictransactions/new/information4.dart';
import 'package:coldencastle/screen/electronictransactions/new/information5.dart';
import 'package:coldencastle/screen/electronictransactions/new/information6.dart';
import 'package:coldencastle/screen/electronictransactions/new/infromation.dart';
import 'package:coldencastle/widget/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Newelectronic extends StatefulWidget {
  const Newelectronic({super.key});

  @override
  State<Newelectronic> createState() => _NewelectronicState();
}

class _NewelectronicState extends State<Newelectronic> {
  clean() {
    setState(() {
      ElectronicTransactionsClass.clean();
    });
  }

  @override
  void initState() {
    clean();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          //  رجوع
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(All.appbarheight),
              child:
                  // تصميم appbar
                  CustomAppBar(
                title: "165".tr,
                // hint
                actions: Container(),
                // زر الرجوع
                leading: GestureDetector(
                    onTap: () => Get.back(),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      size: All.arrowsize,
                      color: Colors.white,
                    )),
              )),
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: ElectronicTransactionsClass.pageController,
            children: const [
              NewInformation(),
              NewInformation2(),
              NewInformation3(),
              NewInformation4(),
              NewInformation5(),
              NewInformation6()
            ],
          ),
        ));
  }
}
