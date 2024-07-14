import 'dart:convert';
import 'dart:io';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:gcc/constant/account.dart';
import 'package:gcc/constant/all.dart';
import 'package:gcc/constant/api.dart';
import 'package:gcc/constant/color.dart';
import 'package:gcc/constant/language.dart';
import 'package:gcc/constant/section.dart';
import 'package:gcc/widget/customButton.dart';
import 'package:gcc/widget/customloading.dart';
import 'package:gcc/widget/customtext.dart';
import 'package:gcc/widget/customtextfiled.dart';
import 'package:gcc/widget/errorMessage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AccountInformation extends StatefulWidget {
  const AccountInformation({super.key});

  @override
  State<AccountInformation> createState() => _AccountInformationState();
}

class _AccountInformationState extends State<AccountInformation> {
  Future uploadimage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    setState(() {
      AccountClass.personalimage = File(image.path);
      // All.profileimage.text = image.path;
      List<int> imageBytes = AccountClass.personalimage!.readAsBytesSync();
      AccountClass.personalimagebyte = base64Encode(imageBytes);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsClass.appbarbg,
          elevation: 0,
          centerTitle: true,
          title: CustomText(
            data: "6".tr,
            size: All.textsize,
            maxLines: 1,
            colors: ColorsClass.textcolorsSecondry,
            fontWeight: FontWeight.bold,
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: FutureBuilder(
              future: AccountClass.viewdata(context),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (AccountClass.account.isEmpty) {
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
                        if (AccountClass.account.isEmpty) {
                          // صورة الانتظار
                          return const CustomLoading();
                        }
                        return Directionality(
                          textDirection: LanguageClass.lang.text == "English"
                              ? TextDirection.ltr
                              : TextDirection.rtl,
                          child: Column(
                            children: [
                              // SizedBox(
                              //   height: 170,
                              //   width: 170,
                              //   child: Stack(
                              //     fit: StackFit.expand,
                              //     clipBehavior: Clip.none,
                              //     children: [
                              //       AccountClass.personalimage != null
                              //           ? Center(
                              //               child: Container(
                              //                 margin:
                              //                     const EdgeInsets.symmetric(
                              //                         vertical: 10),
                              //                 height: 150,
                              //                 width: 150,
                              //                 decoration: BoxDecoration(
                              //                     borderRadius:
                              //                         BorderRadius.circular(20),
                              //                     image: DecorationImage(
                              //                         fit: BoxFit.fill,
                              //                         image: FileImage(
                              //                             AccountClass
                              //                                 .personalimage!))),
                              //               ),
                              //             )
                              //           : All.profileimage.text != "null"
                              //               ? Center(
                              //                   child: Container(
                              //                     margin: const EdgeInsets
                              //                         .symmetric(vertical: 10),
                              //                     height: 150,
                              //                     width: 150,
                              //                     child: CircleAvatar(
                              //                       radius: 90,
                              //                       backgroundColor:
                              //                           Colors.black38,
                              //                       backgroundImage: NetworkImage(
                              //                           "${ApiClass.apiImg}${All.profileimage.text}"),
                              //                     ),
                              //                   ),
                              //                 )
                              //               : Center(
                              //                   child: Container(
                              //                     margin: const EdgeInsets
                              //                         .symmetric(vertical: 10),
                              //                     height: 150,
                              //                     width: 150,
                              //                     decoration: BoxDecoration(
                              //                         borderRadius:
                              //                             BorderRadius.circular(
                              //                                 20),
                              //                         image: DecorationImage(
                              //                             fit: BoxFit.fill,
                              //                             image: AssetImage(All
                              //                                 .splashImage))),
                              //                   ),
                              //                 ),
                              //       Positioned(
                              //         right: -15,
                              //         bottom: -15,
                              //         child: GestureDetector(
                              //           onTap: () => uploadimage(),
                              //           child: Container(
                              //             width: 50,
                              //             height: 50,
                              //             decoration: BoxDecoration(
                              //                 borderRadius:
                              //                     BorderRadius.circular(25)),
                              //             child: Icon(
                              //               Icons.camera,
                              //               size: All.iconSize,
                              //               color: ColorsClass.bgfavouritecolor,
                              //             ),
                              //           ),
                              //         ),
                              //       )
                              //     ],
                              //   ),
                              // ),
                     
                              FadeInDown(
                                duration: SectionClass.duration,
                                child: CustomTextField(
                                  controller: AccountClass.fullname,
                                  hint: "35".tr,
                                  textInputType: TextInputType.name,
                                  obscureText: false,
                                ),
                              ),
                              FadeInLeft(
                                duration: SectionClass.duration,
                                child: CustomTextField(
                                    obscureText: false,
                                    controller: AccountClass.email,
                                    hint: "36".tr,
                                    textInputType: TextInputType.emailAddress),
                              ),
                              FadeInRight(
                                duration: SectionClass.duration,
                                child: CustomTextField(
                                    obscureText: false,
                                    controller: AccountClass.phone,
                                    hint: "38".tr,
                                    textInputType: TextInputType.phone),
                              ),
                              FadeInLeft(
                                duration: SectionClass.duration,
                                child: CustomTextField(
                                    obscureText: false,
                                    controller: AccountClass.address,
                                    hint: "44".tr,
                                    textInputType: TextInputType.streetAddress),
                              ),
                              FadeInUp(
                                duration: SectionClass.duration,
                                child: CustomTextField(
                                    obscureText: true,
                                    controller: AccountClass.password,
                                    hint: "37".tr,
                                    textInputType: TextInputType.name),
                              ),
                              CustomButton(color: ColorsClass.bgfavouritecolor,
                                  data: "39".tr,
                                  onTap: () => AccountClass.editdata(context))
                            ],
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
              }),
        ));
  }
}
