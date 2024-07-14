import 'package:coldencastle/constant/constant.dart';
import 'package:coldencastle/screen/electronictransactions/renewal/information2.dart';
import 'package:coldencastle/screen/electronictransactions/renewal/information3.dart';
import 'package:coldencastle/screen/electronictransactions/renewal/information4.dart';
import 'package:coldencastle/screen/electronictransactions/renewal/information5.dart';
import 'package:coldencastle/screen/electronictransactions/renewal/information6.dart';
import 'package:coldencastle/screen/electronictransactions/renewal/infromation.dart';
import 'package:coldencastle/widget/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ElectronicTransactions extends StatefulWidget {
  const ElectronicTransactions({super.key});

  @override
  State<ElectronicTransactions> createState() => _ElectronicTransactionsState();
}

class _ElectronicTransactionsState extends State<ElectronicTransactions> {
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
              title: "166".tr,
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
          controller: ElectronicTransactionsClass.pageControllers,
          children: const [
            Information(),
            Information2(),
            Information3(),
            Information4(),
            Information5(),
            Information6(),
          ],
        ),
      ),
    );
  }
}
