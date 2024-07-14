// ignore_for_file: non_constant_identifier_names

import 'package:credit_card/Pages/CreditCard/viewwallet.dart';
import 'package:credit_card/constant/authintication.dart';
import 'package:credit_card/constant/creditcard.dart';
import 'package:credit_card/constant/root.dart';
import 'package:credit_card/widget/customloading.dart';
import 'package:credit_card/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CreditCard extends StatelessWidget {
  const CreditCard({super.key});

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
            data: "6".tr,
            fontWeight: FontWeight.w700,
            size: Root.headertextsize),
      ),
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder(
                  future: CreditCardClass.getcreditcardinformation(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data.length == 0) {
                        return Container();
                      }
                      return CarouselSlider.builder(
                          itemCount: snapshot.data.length,
                          options: CarouselOptions(
                            autoPlay: false,
                            enlargeCenterPage: true,
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enableInfiniteScroll: true,
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 800),
                            viewportFraction: 1,
                          ),
                          itemBuilder: (context, index, realIndex) =>
                              Directionality(
                                textDirection: TextDirection.ltr,
                                child: SizedBox(
                                  width: Get.width,
                                  child: CreditCardWidget(
                                    cardNumber: snapshot.data[index]['Num'],
                                    expiryDate: snapshot.data[index]['exp'],
                                    cardHolderName: snapshot.data[index]
                                        ['name'],
                                    cvvCode: snapshot.data[index]['cvv'],
                                    showBackView: false,
                                    cardBgColor: Colors.transparent,
                                    backgroundImage: Root.creditcardbg,
                                    labelValidThru: 'Exp',
                                    obscureCardNumber:
                                        CreditCardClass.showdietals,
                                    obscureInitialCardNumber:
                                        CreditCardClass.showdietals,
                                    obscureCardCvv: CreditCardClass.showdietals,
                                    isHolderNameVisible: true,
                                    height: Get.height / 4,
                                    textStyle: TextStyle(
                                        color: Root.secondary, fontSize: 18),
                                    width: Get.width,
                                    isChipVisible: true,
                                    isSwipeGestureEnabled: false,
                                    animationDuration:
                                        const Duration(milliseconds: 1000),
                                    customCardTypeIcons: [
                                      CustomCardTypeIcon(
                                        cardType: CardType.mastercard,
                                        cardImage: Image.asset(
                                          Root.creditcardlogo,
                                          height: 45,
                                          width: 45,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ],
                                    onCreditCardWidgetChange:
                                        (CreditCardBrand) {},
                                  ),
                                ),
                              ));
                    }
                    return const Center(child: Customloading());
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () async {
                      if (CreditCardClass.showdietals == true) {
                        final auth = await AuthinticationClass.fingureauth();
                        if (auth) {
                          CreditCardClass.showdietals = true;
                          Get.forceAppUpdate();
                        }
                      } else {
                        CreditCardClass.showdietals = false;
                        Get.forceAppUpdate();
                      }
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Icon(
                            CreditCardClass.showdietals
                                ? FontAwesomeIcons.solidEye
                                : FontAwesomeIcons.solidEyeSlash,
                            size: 25,
                            color: Root.primary,
                          ),
                        ),
                        CustomText(
                            colors: Root.primary,
                            data:
                                CreditCardClass.showdietals ? "40".tr : "46".tr,
                            fontWeight: FontWeight.w700,
                            size: Root.textsize - 5),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      final auth = await AuthinticationClass.fingureauth();
                      if (auth) {
                        Get.to(() => const ViewWallet(),
                            transition: Transition.fadeIn);
                      }
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Icon(
                            FontAwesomeIcons.wallet,
                            size: 25,
                            color: Root.primary,
                          ),
                        ),
                        CustomText(
                            colors: Root.primary,
                            data: "41".tr,
                            fontWeight: FontWeight.w700,
                            size: Root.textsize - 5),
                      ],
                    ),
                  )
                ],
              ),
              FutureBuilder(
                  future: CreditCardClass.getdata(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data.length == 0) {
                        return Container();
                      }
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          children: List.generate(1, (index) {
                            return Container(
                              margin: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Root.primary,
                                  border: Border.all(
                                      color: Root.primary, width: 2)),
                              child: GestureDetector(
                                onTap: () {},
                                child: CarouselSlider.builder(
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (context, index, realIndex) =>
                                      Container(
                                    width: Get.width,
                                    height: Get.height,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage(
                                              snapshot.data[index],
                                            ))),
                                  ),
                                  options: CarouselOptions(
                                    height: Get.height / 3.5,
                                    autoPlay: true,
                                    enlargeCenterPage: true,
                                    autoPlayCurve: Curves.fastOutSlowIn,
                                    enableInfiniteScroll: true,
                                    autoPlayAnimationDuration:
                                        const Duration(milliseconds: 800),
                                    viewportFraction: 1,
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      );
                    }
                    return const Customloading();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
