import 'package:credit_card/constant/language.dart';
import 'package:credit_card/constant/root.dart';
import 'package:credit_card/constant/transitionclass.dart';
import 'package:credit_card/widget/customloading.dart';
import 'package:credit_card/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Operations extends StatelessWidget {
  const Operations({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 7,
          shadowColor: Root.primary,
          centerTitle: true,
          title: CustomText(
              colors: Root.primary,
              data: "11".tr,
              fontWeight: FontWeight.w700,
              size: Root.headertextsize),
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Icon(
                Icons.arrow_back_ios_new,
                size: Root.iconSize,
                color: Root.primary,
              ),
            ),
          ),
        ),
        backgroundColor: Root.bgprimary,
        body: Directionality(
          textDirection: LanguageClass.lang.text == "English"
              ? TextDirection.ltr
              : TextDirection.rtl,
          child: SafeArea(
            child: FutureBuilder(
                future: TransitionClass.gettransition(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data.length == 0) {
                      return const Center(
                        child: Customloading(),
                      );
                    }
                    return ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            padding: const EdgeInsets.all(2),
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    color: Root.primary, width: 1.3)),
                            child: ListTile(
                              title: Row(
                                children: [
                                  CustomText(
                                      data: snapshot.data[index]['type'] == "1"
                                          ? "${"7".tr} : "
                                          : "${"8".tr} : ",
                                      size: Root.textsize,
                                      colors: Colors.black,
                                      fontWeight: FontWeight.bold),
                                  CustomText(
                                      data: snapshot.data[index]['operation'],
                                      size: Root.textsize,
                                      colors:
                                          snapshot.data[index]['type'] == "1"
                                              ? Colors.green
                                              : Colors.red,
                                      fontWeight: FontWeight.bold)
                                ],
                              ),
                              subtitle: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                      data: TransitionClass.convert(
                                          snapshot.data[index]['transition']),
                                      size: Root.textsize,
                                      colors:
                                          snapshot.data[index]['type'] == "1"
                                              ? Colors.green
                                              : Colors.red,
                                      fontWeight: FontWeight.bold),
                                  CustomText(
                                      data: snapshot.data[index]['date'],
                                      size: Root.textsize,
                                      colors: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ],
                              ),
                              trailing: Icon(
                                snapshot.data[index]['type'] == "1"
                                    ? Icons.arrow_outward_rounded
                                    : Icons.transit_enterexit_outlined,
                                size: Root.iconSize,
                                color: snapshot.data[index]['type'] == "1"
                                    ? Colors.green
                                    : Colors.red,
                              ),
                            ),
                          );
                        });
                  }
                  return const Center(child: Customloading());
                }),
          ),
        ),
      ),
    );
  }
}
