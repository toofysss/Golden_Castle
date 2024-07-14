// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:gcc/constant/all.dart';
import 'package:gcc/constant/color.dart';
import 'package:gcc/constant/language.dart';
import 'package:gcc/constant/wallet.dart';
import 'package:gcc/widget/customButton.dart';
import 'package:gcc/widget/customtext.dart';
import 'package:get/get.dart';

class AddPayment extends StatefulWidget {
  const AddPayment({super.key});

  @override
  State<AddPayment> createState() => _AddPaymentState();
}

class _AddPaymentState extends State<AddPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsClass.appbarbg,
        elevation: 0,
        centerTitle: true,
        title: CustomText(
          maxLines: 1,
          data: "29".tr,
          size: All.textsize,
          colors: ColorsClass.textcolorsSecondry,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Directionality(
          textDirection: LanguageClass.lang.text == "English"
              ? TextDirection.ltr
              : TextDirection.rtl,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "46".tr,
                  style: TextStyle(
                      fontSize: All.titlesize,
                      color: ColorsClass.iconcolor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              // ar radio button
              SizedBox(
                width: Get.width,
                child: RadioListTile(
                    title: Container(
                      width: 50,
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          All.mastercard,
                          fit: BoxFit.fill,
                          width: Get.width,
                          height: Get.height,
                        ),
                      ),
                    ),
                    activeColor: ColorsClass.iconcolor,
                    // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                    value: "Arabic",
                    groupValue: WalletClass.walletgroup.text,
                    onChanged: (Value) {
                      setState(() {
                        WalletClass.walletgroup.text = "$Value";
                      });
                    }),
              ),
              // en radio
              SizedBox(
                width: Get.width,
                child: RadioListTile(
                    title: Container(
                      width: 50,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          All.zaincash,
                          fit: BoxFit.fill,
                          width: Get.width,
                          height: Get.height,
                        ),
                      ),
                    ),
                    activeColor: ColorsClass.iconcolor,
                    // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                    value: "English",
                    groupValue: WalletClass.walletgroup.text,
                    onChanged: (Value) {
                      setState(() {
                        WalletClass.walletgroup.text = "$Value";
                      });
                    }),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: CustomButton(
                    data: "47".tr, onTap: () => WalletClass.payment(context), color: ColorsClass.bgfavouritecolor,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
