// // كلمة السر
import 'dart:io';
import 'package:animate_do/animate_do.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:coldencastle/constant/constant.dart';
import 'package:coldencastle/widget/custombutton.dart';
import 'package:coldencastle/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

// معلومات ٤
class Information5 extends StatefulWidget {
  const Information5({super.key});

  @override
  State<Information5> createState() => _Information5State();
}

class _Information5State extends State<Information5> {
// صورة بطاقة سكن امامية

  Future frontresidencecard() async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: image.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: '147'.tr,
            toolbarColor: All.color1,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: '147'.tr,
        ),
      ],
    );
    if (croppedFile == null) return;

    setState(() {
      ElectronicTransactionsClass.frontResidenceCard = File(croppedFile.path);
    });
  }

// صورة بطاقة سكن خلفية

  Future backresidencecard() async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: image.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: '148'.tr,
            toolbarColor: All.color1,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: '148'.tr,
        ),
      ],
    );
    if (croppedFile == null) return;
    setState(() {
      ElectronicTransactionsClass.backResidenceCard = File(croppedFile.path);
    });
  }
// عقد الايجار

  Future rentcontract() async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: image.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: '144'.tr,
            toolbarColor: All.color1,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: '144'.tr,
        ),
      ],
    );
    if (croppedFile == null) return;
    setState(() {
      ElectronicTransactionsClass.rentcontract = File(croppedFile.path);
    });
  }

// صورة بطاقة الوطنية امامية

  Future frontnationalcard() async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: image.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: '145'.tr,
            toolbarColor: All.color1,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: '145'.tr,
        ),
      ],
    );
    if (croppedFile == null) return;
    setState(() {
      ElectronicTransactionsClass.frontNationalCard = File(croppedFile.path);
    });
  }

// صورة بطاقة الوطنية خلفية

  Future backnationalcard() async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: image.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: '146'.tr,
            toolbarColor: All.color1,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: '146'.tr,
        ),
      ],
    );
    if (croppedFile == null) return;
    setState(() {
      ElectronicTransactionsClass.backNationalCard = File(croppedFile.path);
    });
  }
// صورة هوية تجارة امامية

  Future businessfrontimage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: image.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: '117'.tr,
            toolbarColor: All.color1,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: '117'.tr,
        ),
      ],
    );
    if (croppedFile == null) return;
    setState(() {
      ElectronicTransactionsClass.frontbusinesscard = File(croppedFile.path);
    });
  }

// صورة هوية تجارة خلفية

  Future businessbackgroundimage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: image.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: '118'.tr,
            toolbarColor: All.color1,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: '118'.tr,
        ),
      ],
    );
    if (croppedFile == null) return;

    setState(() {
      ElectronicTransactionsClass.backbusinesscard = File(croppedFile.path);
    });
  }


// التقط صورة الملف
  Future profileimage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: image.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: '195'.tr,
            toolbarColor: All.color1,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: '195'.tr,
        ),
      ],
    );
    if (croppedFile == null) return;

    setState(() {
      ElectronicTransactionsClass.profileimage = File(croppedFile.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Directionality(
          // تحقق من التطبيق عربي او انكليزي
          textDirection: LanguageClass.lang.text == "English"
              ? TextDirection.ltr
              : TextDirection.rtl,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // صورة عقد ايجار
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: CustomText(
                          color: All.color1,
                          data: "195".tr,
                          size: All.textsize)),
                  Center(
                    child: ElectronicTransactionsClass.profileimage != null
                        ? GestureDetector(
                            onTap: () async {
                              await profileimage();
                            },
                            child: Container(
                              width: Get.width * 0.9,
                              height: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  image: DecorationImage(
                                      image: FileImage(
                                          ElectronicTransactionsClass
                                              .profileimage!),
                                      fit: BoxFit.fill)),
                            ),
                          )
                        : GestureDetector(
                            onTap: () async {
                              await profileimage();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 6.0,
                                    )
                                  ]),
                              width: Get.width * 0.9,
                              height: 200,
                              child: const Center(
                                  child: Icon(
                                Icons.camera_alt_rounded,
                                size: 100,
                                color: Colors.grey,
                              )),
                            ),
                          ),
                  ),

// صورة بطاقة وطنية امامية
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: CustomText(
                          color: All.color1,
                          data: "145".tr,
                          size: All.textsize)),
                  Center(
                    child:
                        // صورة داخل المتحركة

                        ElectronicTransactionsClass.frontNationalCard != null
                            ? GestureDetector(
                                onTap: () async {
                                  await frontnationalcard();
                                },
                                child: Container(
                                  width: Get.width * 0.9,
                                  height: 200,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      image: DecorationImage(
                                          image: FileImage(
                                              ElectronicTransactionsClass
                                                  .frontNationalCard!),
                                          fit: BoxFit.fill)),
                                ),
                              )
                            : GestureDetector(
                                onTap: () async {
                                  await frontnationalcard();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.white,
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(0.0, 1.0), //(x,y)
                                          blurRadius: 6.0,
                                        )
                                      ]),
                                  width: Get.width * 0.9,
                                  height: 200,
                                  child: const Center(
                                      child: Icon(
                                    Icons.camera_alt_rounded,
                                    size: 100,
                                    color: Colors.grey,
                                  )),
                                ),
                              ),
                  ),

// ثورة بطاقة وطنية خلفية
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: CustomText(
                          color: All.color1,
                          data: "146".tr,
                          size: All.textsize)),
                  Center(
                    child:
                        // صورة داخل المتحركة

                        ElectronicTransactionsClass.backNationalCard != null
                            ? GestureDetector(
                                onTap: () async {
                                  await backnationalcard();
                                },
                                child: Container(
                                  width: Get.width * 0.9,
                                  height: 200,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      image: DecorationImage(
                                          image: FileImage(
                                              ElectronicTransactionsClass
                                                  .backNationalCard!),
                                          fit: BoxFit.fill)),
                                ),
                              )
                            : GestureDetector(
                                onTap: () async {
                                  await backnationalcard();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.white,
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(0.0, 1.0), //(x,y)
                                          blurRadius: 6.0,
                                        )
                                      ]),
                                  width: Get.width * 0.9,
                                  height: 200,
                                  child: const Center(
                                      child: Icon(
                                    Icons.camera_alt_rounded,
                                    size: 100,
                                    color: Colors.grey,
                                  )),
                                ),
                              ),
                  ),

// صورة بطاقة سكن امامية
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: CustomText(
                          color: All.color1,
                          data: "147".tr,
                          size: All.textsize)),
                  Center(
                    child:
                        ElectronicTransactionsClass.frontResidenceCard != null
                            ? GestureDetector(
                                onTap: () async {
                                  await frontresidencecard();
                                },
                                child: Container(
                                  width: Get.width * 0.9,
                                  height: 200,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      image: DecorationImage(
                                          image: FileImage(
                                              ElectronicTransactionsClass
                                                  .frontResidenceCard!),
                                          fit: BoxFit.fill)),
                                ),
                              )
                            : GestureDetector(
                                onTap: () async {
                                  await frontresidencecard();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.white,
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(0.0, 1.0), //(x,y)
                                          blurRadius: 6.0,
                                        )
                                      ]),
                                  width: Get.width * 0.9,
                                  height: 200,
                                  child: const Center(
                                      child: Icon(
                                    Icons.camera_alt_rounded,
                                    size: 100,
                                    color: Colors.grey,
                                  )),
                                ),
                              ),
                  ),

// صورة بطاقة سكن خلفية
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: CustomText(
                          color: All.color1,
                          data: "148".tr,
                          size: All.textsize)),
                  Center(
                    child: ElectronicTransactionsClass.backResidenceCard != null
                        ? GestureDetector(
                            onTap: () async {
                              await backresidencecard();
                            },
                            child: Container(
                              width: Get.width * 0.9,
                              height: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  image: DecorationImage(
                                      image: FileImage(
                                          ElectronicTransactionsClass
                                              .backResidenceCard!),
                                      fit: BoxFit.fill)),
                            ),
                          )
                        : GestureDetector(
                            onTap: () async {
                              await backresidencecard();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 6.0,
                                    )
                                  ]),
                              width: Get.width * 0.9,
                              height: 200,
                              child: const Center(
                                  child: Icon(
                                Icons.camera_alt_rounded,
                                size: 100,
                                color: Colors.grey,
                              )),
                            ),
                          ),
                  ),

                  // صورة عقد ايجار
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: CustomText(
                          color: All.color1,
                          data: "117".tr,
                          size: All.textsize)),
                  Center(
                    child: ElectronicTransactionsClass.frontbusinesscard != null
                        ? GestureDetector(
                            onTap: () async {
                              await businessfrontimage();
                            },
                            child: Container(
                              width: Get.width * 0.9,
                              height: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  image: DecorationImage(
                                      image: FileImage(
                                          ElectronicTransactionsClass
                                              .frontbusinesscard!),
                                      fit: BoxFit.fill)),
                            ),
                          )
                        : GestureDetector(
                            onTap: () async {
                              await businessfrontimage();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 6.0,
                                    )
                                  ]),
                              width: Get.width * 0.9,
                              height: 200,
                              child: const Center(
                                  child: Icon(
                                Icons.camera_alt_rounded,
                                size: 100,
                                color: Colors.grey,
                              )),
                            ),
                          ),
                  ),

// صورة بطاقة وطنية امامية
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: CustomText(
                          color: All.color1,
                          data: "118".tr,
                          size: All.textsize)),
                  Center(
                    child:
                        // صورة داخل المتحركة

                        ElectronicTransactionsClass.backbusinesscard != null
                            ? GestureDetector(
                                onTap: () async {
                                  await businessbackgroundimage();
                                },
                                child: Container(
                                  width: Get.width * 0.9,
                                  height: 200,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      image: DecorationImage(
                                          image: FileImage(
                                              ElectronicTransactionsClass
                                                  .backbusinesscard!),
                                          fit: BoxFit.fill)),
                                ),
                              )
                            : GestureDetector(
                                onTap: () async {
                                  await businessbackgroundimage();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.white,
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(0.0, 1.0), //(x,y)
                                          blurRadius: 6.0,
                                        )
                                      ]),
                                  width: Get.width * 0.9,
                                  height: 200,
                                  child: const Center(
                                      child: Icon(
                                    Icons.camera_alt_rounded,
                                    size: 100,
                                    color: Colors.grey,
                                  )),
                                ),
                              ),
                  ),
                  // صورة عقد ايجار
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: CustomText(
                          color: All.color1,
                          data: "144".tr,
                          size: All.textsize)),
                  Center(
                    child: ElectronicTransactionsClass.rentcontract != null
                        ? GestureDetector(
                            onTap: () async {
                              await rentcontract();
                            },
                            child: Container(
                              width: Get.width * 0.9,
                              height: 500,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  image: DecorationImage(
                                      image: FileImage(
                                          ElectronicTransactionsClass
                                              .rentcontract!),
                                      fit: BoxFit.fill)),
                            ),
                          )
                        : GestureDetector(
                            onTap: () async {
                              await rentcontract();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 6.0,
                                    )
                                  ]),
                              width: Get.width * 0.9,
                              height: 500,
                              child: const Center(
                                  child: Icon(
                                Icons.camera_alt_rounded,
                                size: 100,
                                color: Colors.grey,
                              )),
                            ),
                          ),
                  ),

                  Center(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // رجوع
                          FadeInDown(
                              duration: All.duration,
                              child: Container(
                                  width: Get.width / 2.5,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 10),
                                  child:
                                      // تصميم زر
                                      CustomButton(
                                          data: "120".tr,
                                          onTap: () {
                                            ElectronicTransactionsClass
                                                .pageControllers
                                                .jumpToPage(3);
                                          }))),
                          //  التالي
                          FadeInDown(
                              duration: All.duration,
                              child: Container(
                                  width: Get.width / 2.5,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 10),
                                  child:
                                      // تصميم زر

                                      CustomButton(
                                          data: "116".tr,
                                          onTap: () {
                                            if (ElectronicTransactionsClass
                                                        .backbusinesscard ==
                                                    null ||
                                                ElectronicTransactionsClass
                                                        .backResidenceCard ==
                                                    null ||
                                                ElectronicTransactionsClass
                                                        .frontResidenceCard ==
                                                    null ||
                                                ElectronicTransactionsClass
                                                        .frontNationalCard ==
                                                    null ||
                                                ElectronicTransactionsClass
                                                        .rentcontract ==
                                                    null ||
                                             
                                                ElectronicTransactionsClass
                                                        .frontbusinesscard ==
                                                    null) {
                                              AwesomeDialog(
                                                      context: context,
                                                      animType: AnimType.scale,
                                                      dialogType:
                                                          DialogType.error,
                                                      body: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                vertical: 8.0),
                                                        child: Center(
                                                          child: CustomText(
                                                              color:
                                                                  Colors.black,
                                                              data: "119".tr,
                                                              size:
                                                                  All.textsize),
                                                        ),
                                                      ),
                                                      btnCancelColor:
                                                          Colors.green,
                                                      btnCancelText: "105".tr,
                                                      btnCancelOnPress: () {})
                                                  .show();
                                            } else {
                                              ElectronicTransactionsClass
                                                  .pageControllers
                                                  .jumpToPage(5);
                                            }
                                          }))),
                        ],
                      ),
                    ),
                  )

                  // زر تغيير كلمة السر
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
