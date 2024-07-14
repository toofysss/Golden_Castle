import 'package:flutter/material.dart';
import 'package:gcc/constant/all.dart';
import 'package:gcc/constant/color.dart';
import 'package:gcc/constant/wallet.dart';
import 'package:gcc/widget/customButton.dart';
import 'package:gcc/widget/customloading.dart';
import 'package:gcc/widget/customtext.dart';
import 'package:gcc/widget/errorMessage.dart';
import 'package:get/get.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return WalletClass.history.isEmpty
        ? CustomButton(
            color: ColorsClass.bgfavouritecolor,
            data: "31".tr,
            onTap: () => Future.delayed(const Duration(milliseconds: 10),
                    () => WalletClass.gethistory(context)).then((value) {
                  setState(() {
                    WalletClass.history = WalletClass.history;
                  });
                }))
        : FutureBuilder(
            future: WalletClass.gethistory(context),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (WalletClass.history.isEmpty) {
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
                    itemCount: WalletClass.history.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (WalletClass.history.isEmpty) {
                        // صورة الانتظار
                        return const CustomLoading();
                      }
                      return Container(
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: ColorsClass.bordercolor, width: 1)),
                        child: ListTile(
                          title: Row(
                            children: [
                              CustomText(
                                  maxLines: 1,
                                  data:
                                      "${WalletClass.wallet[index]['Dscrp']}" ==
                                              "البنوك2"
                                          ? "${"32".tr} : "
                                          : "${"33".tr} : ",
                                  size: All.textsize,
                                  colors: Colors.black,
                                  fontWeight: FontWeight.bold),
                              CustomText(
                                  maxLines: 1,
                                  data: "${WalletClass.wallet[index]['Dscrp']}",
                                  size: All.textsize,
                                  colors:
                                      "${WalletClass.wallet[index]['Dscrp']}" ==
                                              "البنوك2"
                                          ? Colors.green
                                          : Colors.red,
                                  fontWeight: FontWeight.bold)
                            ],
                          ),
                          subtitle: CustomText(
                              maxLines: 1,
                              data: "${WalletClass.wallet[index]['Dscrp']}",
                              size: All.textsize,
                              colors: "${WalletClass.wallet[index]['Dscrp']}" ==
                                      "البنوك2"
                                  ? Colors.green
                                  : Colors.red,
                              fontWeight: FontWeight.bold),
                          trailing: Icon(
                            "${WalletClass.wallet[index]['Dscrp']}" == "البنوك2"
                                ? Icons.arrow_outward_rounded
                                : Icons.transit_enterexit_outlined,
                            size: All.iconSize,
                            color: "${WalletClass.wallet[index]['Dscrp']}" ==
                                    "البنوك2"
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                      );
                    });
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                // صورة الانتظار

                return const CustomLoading();
              }
              // صورة الانتظار

              return const CustomLoading();
            });
  }
}
