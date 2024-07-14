import 'dart:convert';
import 'dart:io';
import 'package:animate_do/animate_do.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:coldencastle/constant/constant.dart';
import 'package:coldencastle/widget/customappbar.dart';
import 'package:coldencastle/widget/custombutton.dart';
import 'package:coldencastle/widget/customtext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

// المعلومات ١
class CertificateOfRiginInformation2 extends StatefulWidget {
  const CertificateOfRiginInformation2({super.key});

  @override
  State<CertificateOfRiginInformation2> createState() =>
      _CertificateOfRiginInformation2State();
}

class _CertificateOfRiginInformation2State
    extends State<CertificateOfRiginInformation2> {
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
      ElectronicCertificateOfOriginClass.frontbusinesscard =
          File(croppedFile.path);
    });

    List<int> imageBytes =
        ElectronicCertificateOfOriginClass.frontbusinesscard!.readAsBytesSync();

    ElectronicCertificateOfOriginClass.frontbusinesscardbyte =
        base64Encode(imageBytes);
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
      ElectronicCertificateOfOriginClass.backbusinesscard =
          File(croppedFile.path);
    });

    List<int> imageBytes =
        ElectronicCertificateOfOriginClass.backbusinesscard!.readAsBytesSync();

    ElectronicCertificateOfOriginClass.backbusinesscardbyte =
        base64Encode(imageBytes);
  }

// صورة الفاتورة
  Future invoiceimage() async {
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
            toolbarTitle: '223'.tr,
            toolbarColor: All.color1,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: '223'.tr,
        ),
      ],
    );
    if (croppedFile == null) return;
    setState(() {
      ElectronicCertificateOfOriginClass.invoiceimage = File(croppedFile.path);
    });
    List<int> imageBytes =
        ElectronicCertificateOfOriginClass.invoiceimage!.readAsBytesSync();

    ElectronicCertificateOfOriginClass.invoiceimagebyte =
        base64Encode(imageBytes);
  }
// صورة   الاجازة

  Future vactionimages() async {
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
            toolbarTitle: '224'.tr,
            toolbarColor: All.color1,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: '224'.tr,
        ),
      ],
    );
    if (croppedFile == null) return;

    setState(() {
      ElectronicCertificateOfOriginClass.vactionimage = File(croppedFile.path);
    });
    List<int> imageBytes =
        ElectronicCertificateOfOriginClass.vactionimage!.readAsBytesSync();
    ElectronicCertificateOfOriginClass.vactionimagebyte =
        base64Encode(imageBytes);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(All.appbarheight),
            child:
                // تصميم appbar
                CustomAppBar(
              title: "140".tr,
              // hint
              actions: Container(),
              // زر الرجوع
              leading: GestureDetector(
                  onTap: () => Get.back(),
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: All.arrowsize,
                    color: Colors.white,
                  )),
            )),
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
                  // صورة بطاقة وطنية امامية
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: CustomText(
                          color: All.color1,
                          data: "117".tr,
                          size: All.textsize)),
                  Center(
                    child:
                        ElectronicCertificateOfOriginClass.frontbusinesscard !=
                                null
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
                                              ElectronicCertificateOfOriginClass
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

// صورة بطاقة وطنية خلفية
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

                        ElectronicCertificateOfOriginClass.backbusinesscard !=
                                null
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
                                              ElectronicCertificateOfOriginClass
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

                  // صورة  الفاتورة
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: CustomText(
                          color: All.color1,
                          data: "223".tr,
                          size: All.textsize)),
                  Center(
                    child:
                        ElectronicCertificateOfOriginClass.invoiceimage != null
                            ? GestureDetector(
                                onTap: () async {
                                  await invoiceimage();
                                },
                                child: Container(
                                  width: Get.width * 0.9,
                                  height: 600,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      image: DecorationImage(
                                          image: FileImage(
                                              ElectronicCertificateOfOriginClass
                                                  .invoiceimage!),
                                          fit: BoxFit.fill)),
                                ),
                              )
                            : GestureDetector(
                                onTap: () async {
                                  await invoiceimage();
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
                                  height: 600,
                                  child: const Center(
                                      child: Icon(
                                    Icons.camera_alt_rounded,
                                    size: 100,
                                    color: Colors.grey,
                                  )),
                                ),
                              ),
                  ),

// صورة   الاجازة
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: CustomText(
                          color: All.color1,
                          data: "224".tr,
                          size: All.textsize)),
                  Center(
                    child:
                        // صورة داخل المتحركة

                        ElectronicCertificateOfOriginClass.vactionimage != null
                            ? GestureDetector(
                                onTap: () async {
                                  await vactionimages();
                                },
                                child: Container(
                                  width: Get.width * 0.9,
                                  height: 600,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      image: DecorationImage(
                                          image: FileImage(
                                              ElectronicCertificateOfOriginClass
                                                  .vactionimage!),
                                          fit: BoxFit.fill)),
                                ),
                              )
                            : GestureDetector(
                                onTap: () async {
                                  await vactionimages();
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
                                  height: 600,
                                  child: const Center(
                                      child: Icon(
                                    Icons.camera_alt_rounded,
                                    size: 100,
                                    color: Colors.grey,
                                  )),
                                ),
                              ),
                  ),

                  // زر التالي
                  Center(
                    child: FadeInDown(
                        duration: All.duration,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child:
                              // تصميم زر
                              CustomButton(
                                  data: "121".tr,
                                  onTap: () {
                                    if (ElectronicCertificateOfOriginClass
                                                .frontbusinesscard ==
                                            null ||
                                        ElectronicCertificateOfOriginClass
                                                .backbusinesscard ==
                                            null ||
                                        ElectronicCertificateOfOriginClass
                                                .invoiceimage ==
                                            null ||
                                        ElectronicCertificateOfOriginClass
                                                .vactionimage ==
                                            null) {
                                      AwesomeDialog(
                                              context: context,
                                              animType: AnimType.scale,
                                              dialogType: DialogType.error,
                                              body: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8.0),
                                                child: Center(
                                                  child: CustomText(
                                                      color: Colors.black,
                                                      data: "123".tr,
                                                      size: All.textsize),
                                                ),
                                              ),
                                              btnCancelColor: Colors.green,
                                              btnCancelText: "105".tr,
                                              btnCancelOnPress: () {})
                                          .show();
                                    } else {
                                      ElectronicCertificateOfOriginClass
                                          .requestCertificate(context);
                                    }
                                  }),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
