import 'package:flutter/material.dart';
import 'package:gcc/Pages/Wallet/history.dart';
import 'package:gcc/constant/all.dart';
import 'package:gcc/constant/color.dart';
import 'package:gcc/constant/language.dart';
import 'package:gcc/constant/wallet.dart';
import 'package:gcc/widget/customButton.dart';
import 'package:gcc/widget/customloading.dart';
import 'package:gcc/widget/customtext.dart';
import 'package:gcc/widget/errorMessage.dart';
import 'package:get/get.dart';

class ViewWallet extends StatelessWidget {
  const ViewWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsClass.appbarbg,
        elevation: 0,
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () => WalletClass.addWallet(),
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: Center(
                    child: CustomText(
                        maxLines: 1,
                        data: "29".tr,
                        size: All.textsize,
                        colors: ColorsClass.textcolorsSecondry,
                        fontWeight: FontWeight.bold))),
          )
        ],
        title: CustomText(
          maxLines: 1,
          data: "5".tr,
          size: All.textsize,
          colors: ColorsClass.textcolorsSecondry,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Directionality(
          textDirection: LanguageClass.lang.text == "English"
              ? TextDirection.ltr
              : TextDirection.rtl,
          child: FutureBuilder(
              future: WalletClass.getdata(context),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (WalletClass.wallet.isEmpty) {
                    return const CustomLoading();
                  }
                }

                if (snapshot.hasError) {
                  return ErrorMessage(
                    subtitle: "25".tr,
                    title: "24".tr,
                  );
                }
                if (snapshot.hasData) {
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: 1,
                      itemBuilder: (BuildContext context, int index) {
                        if (WalletClass.wallet.isEmpty) {
                          // صورة الانتظار
                          return const CustomLoading();
                        }
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: ListTile(
                                  title: CustomText(
                                      maxLines: 1,
                                      data:
                                          "${"30".tr} : ${WalletClass.wallet[index]['Dscrp']}",
                                      size: All.textsize,
                                      colors: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )),
                            CustomButton(
                                data: "34".tr,
                                onTap: () => WalletClass.transformWallet(), color: ColorsClass.bgfavouritecolor,),
                            const History()
                          ],
                        );
                      });
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  // صورة الانتظار

                  return const CustomLoading();
                }
                // صورة الانتظار

                return const CustomLoading();
              })),
    );
  }
}
