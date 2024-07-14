import 'package:flutter/material.dart';
import 'package:gcc/constant/all.dart';
import 'package:gcc/constant/color.dart';
import 'package:gcc/constant/language.dart';
import 'package:gcc/constant/wallet.dart';
import 'package:gcc/widget/customButton.dart';
import 'package:gcc/widget/customtext.dart';
import 'package:gcc/widget/customtextfiled.dart';
import 'package:get/get.dart';

class TransformWallet extends StatelessWidget {
  const TransformWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsClass.appbarbg,
          elevation: 0,
          centerTitle: true,
          title: CustomText(
            maxLines: 1,
            data: "34".tr,
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
              children: [
                Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(All.splashImage))),
                  ),
                ),
                CustomTextField(
                  controller: WalletClass.tonum,
                  hint: "41".tr,
                  textInputType: TextInputType.number,
                  obscureText: false,
                ),
                CustomTextField(
                  controller: WalletClass.walletPay,
                  hint: "43".tr,
                  textInputType: TextInputType.number,
                  obscureText: false,
                ),
                CustomButton(color: ColorsClass.bgfavouritecolor,
                    data: "42".tr, onTap: () => WalletClass.transData(context))
              ],
            ),
          ),
        ));
  }
}
