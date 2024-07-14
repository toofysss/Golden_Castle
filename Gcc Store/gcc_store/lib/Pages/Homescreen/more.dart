// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names, duplicate_ignore

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/all.dart';
import '../../constant/color.dart';
import '../../constant/language.dart';
import '../../constant/more.dart';
import '../../constant/section.dart';
 import '../../services/services.dart';
import '../../widget/customlisttile.dart';
import '../../widget/customtext.dart';

class More extends StatefulWidget {
  const More({super.key});

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsClass.appbarbg,
        elevation: 0,
        centerTitle: true,
        title: CustomText(
          maxLines: 1,
          data: "17".tr,
          size: All.textsize,
          colors: ColorsClass.textcolorsSecondry,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Directionality(
          textDirection: LanguageClass.lang.text == "English"
              ? TextDirection.ltr
              : TextDirection.rtl,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // //  حسابي
                      // Padding(
                      //     padding: const EdgeInsets.symmetric(
                      //         horizontal: 20, vertical: 10),
                      //     child: CustomText(
                      //         maxLines: 1,
                      //         data: "18".tr,
                      //         colors: ColorsClass.textcolorprimart,
                      //         size: All.titlesize,
                      //         fontWeight: FontWeight.bold)),
                      // myServices.sharedPreferences.getString("login") == "1"
                      //     ? Container(
                      //         margin: const EdgeInsets.all(20),
                      //         decoration: BoxDecoration(
                      //             border: Border.all(
                      //                 color: ColorsClass.bordercolor, width: 1),
                      //             borderRadius: BorderRadius.circular(20)),
                      //         child: GestureDetector(
                      //             onTap: () => MoreClass.login(context),
                      //             child: CustomListTile(
                      //                 title: "15".tr, iconData: Icons.login)),
                      //       )
                      //     : Container(
                      //         margin: const EdgeInsets.all(10),
                      //         decoration: BoxDecoration(
                      //             border: Border.all(
                      //                 color: ColorsClass.bordercolor, width: 1),
                      //             borderRadius: BorderRadius.circular(20)),
                      //         child: Column(
                      //           children: [
                      //             // ملعومات الحساب الشخصي
                      //             GestureDetector(
                      //                 onTap: () =>
                      //                     MoreClass.accountInformation(context),
                      //                 child: CustomListTile(
                      //                     title: "6".tr,
                      //                     iconData: Icons.person)),
                      //             const Divider(
                      //               indent: 20,
                      //               endIndent: 20,
                      //               color: Colors.grey,
                      //               thickness: 1,
                      //             ),
                      //             //  المفضلات
                      //             GestureDetector(
                      //                 onTap: () => MoreClass.favourite(context),
                      //                 child: CustomListTile(
                      //                     title: "73".tr,
                      //                     iconData:
                      //                         Icons.favorite_border_outlined)),
                      //             const Divider(
                      //               indent: 20,
                      //               endIndent: 20,
                      //               color: Colors.grey,
                      //               thickness: 1,
                      //             ),
                      //             // اللغة
                      //             GestureDetector(
                      //                 onTap: () {
                      //                   showDialog(
                      //                       context: context,
                      //                       builder: (context) => Dialog(
                      //                             backgroundColor:
                      //                                 Colors.transparent,
                      //                             child: Stack(
                      //                               children: [
                      //                                 Container(
                      //                                   width: Get.width,
                      //                                   margin: const EdgeInsets
                      //                                       .all(15),
                      //                                   padding:
                      //                                       const EdgeInsets
                      //                                           .symmetric(
                      //                                           horizontal: 32,
                      //                                           vertical: 16),
                      //                                   decoration:
                      //                                       BoxDecoration(
                      //                                     color: ColorsClass
                      //                                         .bottomNavigationBarbg,
                      //                                     borderRadius:
                      //                                         BorderRadius
                      //                                             .circular(15),
                      //                                   ),
                      //                                   child: Directionality(
                      //                                     textDirection:
                      //                                         // تحققق اذا التطبيق عربي او انكليزي
                      //                                         LanguageClass.lang
                      //                                                     .text ==
                      //                                                 "English"
                      //                                             ? TextDirection
                      //                                                 .ltr
                      //                                             : TextDirection
                      //                                                 .rtl,
                      //                                     child: Column(
                      //                                       mainAxisSize:
                      //                                           MainAxisSize
                      //                                               .min,
                      //                                       children: [
                      //                                         Container(
                      //                                           margin:
                      //                                               const EdgeInsets
                      //                                                   .only(
                      //                                                   bottom:
                      //                                                       20),
                      //                                           width: 100,
                      //                                           height: 100,
                      //                                           decoration: BoxDecoration(
                      //                                               borderRadius:
                      //                                                   BorderRadius.circular(
                      //                                                       15),
                      //                                               image: DecorationImage(
                      //                                                   fit: BoxFit
                      //                                                       .fill,
                      //                                                   image: AssetImage(
                      //                                                       All.splashImage))),
                      //                                         ),
                      //                                         Container(
                      //                                             margin: const EdgeInsets
                      //                                                 .only(
                      //                                                 bottom:
                      //                                                     20),
                      //                                             child: CustomText(
                      //                                                 maxLines:
                      //                                                     1,
                      //                                                 data: "7"
                      //                                                     .tr,
                      //                                                 size: All
                      //                                                     .textsize,
                      //                                                 colors: ColorsClass
                      //                                                     .bottomNavigationBarselected,
                      //                                                 fontWeight:
                      //                                                     FontWeight
                      //                                                         .bold)),
                      //                                         // ar radio button
                      //                                         SizedBox(
                      //                                           width:
                      //                                               Get.width,
                      //                                           child:
                      //                                               RadioListTile(
                      //                                                   title:
                      //                                                       Text(
                      //                                                     "27".tr,
                      //                                                     style: TextStyle(
                      //                                                         fontSize: All.textsize,
                      //                                                         fontWeight: FontWeight.bold,
                      //                                                         color: ColorsClass.bottomNavigationBarselected),
                      //                                                   ),
                      //                                                   activeColor:
                      //                                                     ColorsClass
                      //                                                           .bottomNavigationBarselected,
                      //                                                   // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                      //                                                   value:
                      //                                                       "Arabic",
                      //                                                   groupValue: LanguageClass
                      //                                                       .lang
                      //                                                       .text,
                      //                                                   onChanged:
                      //                                                       (Value) {
                      //                                                     setState(
                      //                                                         () {
                      //                                                       LocalController
                      //                                                           myServices =
                      //                                                           Get.find();
                      //                                                       myServices.changeLang("ar");
                      //                                                       LanguageClass.lang.text =
                      //                                                           "$Value";
                      //                                                       Get.back();
                      //                                                     });
                      //                                                   }),
                      //                                         ),
                      //                                         // en radio
                      //                                         SizedBox(
                      //                                           width:
                      //                                               Get.width,
                      //                                           child:
                      //                                               RadioListTile(
                      //                                                   title:
                      //                                                       Text(
                      //                                                     "28".tr,
                      //                                                     style: TextStyle(
                      //                                                         fontSize: All.textsize,
                      //                                                         fontWeight: FontWeight.bold,
                      //                                                         color: ColorsClass.bottomNavigationBarselected),
                      //                                                   ),
                      //                                                   activeColor:
                      //                                                       ColorsClass
                      //                                                           .bottomNavigationBarselected,
                      //                                                   // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
                      //                                                   value:
                      //                                                       "English",
                      //                                                   groupValue: LanguageClass
                      //                                                       .lang
                      //                                                       .text,
                      //                                                   onChanged:
                      //                                                       (Value) {
                      //                                                     setState(
                      //                                                         () {
                      //                                                       LocalController
                      //                                                           myServices =
                      //                                                           Get.find();
                      //                                                       myServices.changeLang("en");
                      //                                                       LanguageClass.lang.text =
                      //                                                           "$Value";
                      //                                                       Get.back();
                      //                                                     });
                      //                                                   }),
                      //                                         ),
                      //                                       ],
                      //                                     ),
                      //                                   ),
                      //                                 ),
                      //                                 Positioned(
                      //                                     top: 0,
                      //                                     right: 0,
                      //                                     child:
                      //                                         GestureDetector(
                      //                                       onTap: () =>
                      //                                           Get.back(),
                      //                                       child: Container(
                      //                                         decoration: BoxDecoration(
                      //                                             borderRadius:
                      //                                                 BorderRadius
                      //                                                     .circular(
                      //                                                         15),
                      //                                             color: Colors
                      //                                                 .red),
                      //                                         child: Center(
                      //                                             child: Icon(
                      //                                           Icons.close,
                      //                                           size: All
                      //                                               .iconSize,
                      //                                           color: Colors
                      //                                               .white,
                      //                                         )),
                      //                                       ),
                      //                                     ))
                      //                               ],
                      //                             ),
                      //                           ));
                      //                 },
                      //                 child: CustomListTile(
                      //                     title: "7".tr,
                      //                     iconData: Icons.language)),
                      //             const Divider(
                      //               indent: 20,
                      //               endIndent: 20,
                      //               color: Colors.grey,
                      //               thickness: 1,
                      //             ),
                      //             // الاشعارات
                      //             GestureDetector(
                      //                 onTap: () =>
                      //                     MoreClass.notifications(context),
                      //                 child: CustomListTile(
                      //                     title: "8".tr,
                      //                     iconData: Icons.notifications)),
                      //             const Divider(
                      //               indent: 20,
                      //               endIndent: 20,
                      //               color: Colors.grey,
                      //               thickness: 1,
                      //             ),
                      //             // الفاتورة
                      //             GestureDetector(
                      //                 onTap: () => MoreClass.invoice(context),
                      //                 child: CustomListTile(
                      //                     title: "14".tr,
                      //                     iconData: Icons.shopify_sharp)),
                      //             const Divider(
                      //               indent: 20,
                      //               endIndent: 20,
                      //               color: Colors.grey,
                      //               thickness: 1,
                      //             ),
                      //             // محفظتي
                      //             GestureDetector(
                      //                 onTap: () => MoreClass.wallet(context),
                      //                 child: CustomListTile(
                      //                     title: "5".tr,
                      //                     iconData: Icons.wallet_rounded)),
                      //             const Divider(
                      //               indent: 20,
                      //               endIndent: 20,
                      //               color: Colors.grey,
                      //               thickness: 1,
                      //             ),
                      //             //  كشف حساب
                      //             GestureDetector(
                      //                 onTap: () =>
                      //                     MoreClass.accountStatment(context),
                      //                 child: CustomListTile(
                      //                     title: "45".tr,
                      //                     iconData: Icons.assignment_outlined)),
                      //             const Divider(
                      //               indent: 20,
                      //               endIndent: 20,
                      //               color: Colors.grey,
                      //               thickness: 1,
                      //             ),
                      //             // تسجيل الخروج
                      //             GestureDetector(
                      //                 onTap: () => MoreClass.logout(context),
                      //                 child: CustomListTile(
                      //                     title: "16".tr,
                      //                     iconData: Icons.logout)),
                      //           ],
                      //         ),
                      //       ),
                      // //  تواصل معنا

                      // Padding(
                      //     padding: const EdgeInsets.symmetric(
                      //         horizontal: 20, vertical: 10),
                      //     child: CustomText(
                      //         maxLines: 1,
                      //         data: "9".tr,
                      //         colors: ColorsClass.textcolorprimart,
                      //         size: All.titlesize,
                      //         fontWeight: FontWeight.bold)),

                      // BounceInUp(
                      //   duration: SectionClass.duration,
                      //   child: Container(
                      //     margin: const EdgeInsets.all(10),
                      //     decoration: BoxDecoration(
                      //         border: Border.all(
                      //             color: ColorsClass.bordercolor, width: 1),
                      //         borderRadius: BorderRadius.circular(20)),
                      //     child: Column(
                      //       children: [
                      //         //  خدمة العملاء
                      //         GestureDetector(
                      //             onTap: () => MoreClass.invoice(context),
                      //             child: CustomListTile(
                      //                 title: "11".tr,
                      //                 iconData: Icons.headset_mic_outlined)),
                      //         const Divider(
                      //           indent: 20,
                      //           endIndent: 20,
                      //           color: Colors.grey,
                      //           thickness: 1,
                      //         ),
                      //         //  مركز المساعدة
                      //         GestureDetector(
                      //             onTap: () => MoreClass.invoice(context),
                      //             child: CustomListTile(
                      //                 title: "12".tr,
                      //                 iconData: Icons.error_outline)),
                      //         const Divider(
                      //           indent: 20,
                      //           endIndent: 20,
                      //           color: Colors.grey,
                      //           thickness: 1,
                      //         ),
                      //         //  عن الشركة
                      //         GestureDetector(
                      //             onTap: () => MoreClass.invoice(context),
                      //             child: CustomListTile(
                      //                 title: "13".tr,
                      //                 iconData: Icons.help_outline_sharp)),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // const SizedBox(
                      //   height: 65,
                      // )
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
