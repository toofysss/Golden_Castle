import 'package:credit_card/Pages/layer/operations.dart';
import 'package:credit_card/Pages/layer/transitionmoney.dart';
import 'package:credit_card/Pages/layer/wallet.dart';
import 'package:credit_card/constant/authintication.dart';
import 'package:credit_card/controller/languagecontroller.dart';
import 'package:credit_card/localization/changelocal.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Company {
  Color endcolor;
  Color startcolor;
  IconData icon;

  Function() onTap;
  String title;

  Company({
    required this.title,
    required this.icon,
    required this.startcolor,
    required this.endcolor,
    required this.onTap,
  });
}

class LayerClass {
    final LanguageController languageController = Get.find();
    LocalController myServices  =Get.find();
  static List<Company> data = [
    Company(
        title: "9".tr,
        icon: FontAwesomeIcons.locationDot,
        onTap: () {},
        endcolor: const Color.fromARGB(255, 9, 66, 99),
        startcolor: const Color(0xff418EBA)),
    Company(
        title: "10".tr,
        icon: FontAwesomeIcons.buildingColumns,
        onTap: () {},
        endcolor: const Color.fromARGB(255, 25, 92, 97),
        startcolor: const Color(0xff00CCA7)),
    Company(
        title: "11".tr,
        icon: FontAwesomeIcons.commentsDollar,
        onTap: () =>
            Get.to(() => const Operations(), transition: Transition.fadeIn),
        endcolor: const Color(0xff00CCA7),
        startcolor: const Color(0xff30AE5A)),
    Company(
        title: "17".tr,
        icon: FontAwesomeIcons.moneyBillTransfer,
        onTap: () => Get.to(() => const TransitionMoney(),
            transition: Transition.fadeIn),
        endcolor: const Color.fromARGB(255, 228, 138, 3),
        startcolor: const Color.fromARGB(255, 254, 148, 9)),
    Company(
        title: "42".tr,
        icon: FontAwesomeIcons.wallet,
        onTap: () async {
          final auth = await AuthinticationClass.fingureauth();
          if (auth) {
            Get.to(() => const Wallet(), transition: Transition.fadeIn);
          }
        },
        endcolor: const Color.fromARGB(255, 206, 43, 43),
        startcolor: const Color.fromARGB(255, 136, 15, 6)),
  ];


}

class TransitionMoneyClass {
  static TextEditingController creditNo = TextEditingController();
  static TextEditingController mycreditNo = TextEditingController();
  static TextEditingController money = TextEditingController();
}
