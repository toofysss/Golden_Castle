import 'dart:convert';
import 'dart:io';
import 'package:animate_do/animate_do.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:coldencastle/constant/constant.dart';
import 'package:coldencastle/model/rigestercontroller.dart';
import 'package:coldencastle/widget/custombutton.dart';
import 'package:coldencastle/widget/customlisttile.dart';
import 'package:coldencastle/widget/customtext.dart';
import 'package:coldencastle/widget/customtextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:signature/signature.dart';
import 'dart:math' as math;

// التحقق من رقم الاضبارة
class Check extends StatefulWidget {
  const Check({super.key});

  @override
  State<Check> createState() => _CheckState();
}

class _CheckState extends State<Check> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final formkey = GlobalKey<FormState>();
  final formkeycheck = GlobalKey<FormState>();

  @override
  void initState() {
    _controller = AnimationController(
      value: 0.0,
      duration: const Duration(seconds: 5),
      upperBound: 1,
      lowerBound: -1,
      vsync: this,
    )..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        //  رجوع
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: Icon(
              Icons.arrow_back_ios_new,
              size: All.arrowsize,
              color: Colors.white,
            ),
          ),
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Scaffold(
          backgroundColor: Colors.white,
          body: Directionality(
            // تحقق من التطبيق عربي او انكليزي
            textDirection: LanguageClass.lang.text == "English"
                ? TextDirection.ltr
                : TextDirection.rtl,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      //  المتحركة
                      AnimatedBuilder(
                        animation: _controller,
                        builder: (BuildContext context, child) {
                          return ClipPath(
                            clipper: DrawClip(_controller.value),
                            child: Container(
                              height: Get.height * 0.5,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight,
                                    colors: [All.color2, All.color1]),
                              ),
                            ),
                          );
                        },
                      ),
                      // صورة داخل المتحركة
                      Container(
                          padding: const EdgeInsets.only(bottom: 60),
                          child: CircleAvatar(
                            radius: 110,
                            backgroundColor: Colors.transparent,
                            backgroundImage: AssetImage(All.splashImage),
                          )),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: CustomText(
                        color: Colors.black,
                        data: "114".tr,
                        size: All.textsize),
                  ),
                  // ادخال رمز الاضبارة
                  Center(
                    child: FadeInRight(
                      duration: All.duration,
                      child: Container(
                        width: Get.width * 0.9,
                        margin: const EdgeInsets.only(top: 18),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: All.color1,
                            )
                          ],
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: CustomListTile(
                          leading: SizedBox(
                            width: 100,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                iconEnabledColor: All.color1,
                                iconDisabledColor: All.color1,
                                borderRadius: BorderRadius.circular(25),
                                hint: CustomText(
                                    color: All.color1,
                                    data: RigesterClass.search,
                                    size: All.textsize),
                                onChanged: (value) {
                                  setState(() {
                                    RigesterClass.search = value!;
                                  });
                                },
                                items: [
                                  "أ",
                                  "ب",
                                  "ت",
                                  "ث",
                                  "ج",
                                  "ح",
                                  "خ",
                                  "د",
                                  "ذ",
                                  "ر",
                                  "ز",
                                  "س",
                                  "ش",
                                  "ص",
                                  "ض",
                                  "ط",
                                  "ظ",
                                  "ع",
                                  "غ",
                                  "ف",
                                  "ق",
                                  "ك",
                                  "ل",
                                  "م",
                                  "ن",
                                  "ه",
                                  "و",
                                  "ي"
                                ]
                                    .map<DropdownMenuItem<String>>(
                                        (String value) =>
                                            DropdownMenuItem<String>(
                                                value: value,
                                                child: CustomText(
                                                    color: All.color1,
                                                    data: value,
                                                    size: All.textsize)))
                                    .toList(),
                              ),
                            ),
                          ),
                          title: TextFormField(
                            //   //  التحكم
                            controller: RigesterClass.azbaranum,
                            style: TextStyle(
                                fontSize: All.textfieldsize,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            keyboardType: TextInputType.phone,
                            textInputAction: TextInputAction.next,
                            cursorColor: All.color1,
                            decoration: InputDecoration(
                              labelText: "97".tr,
                              labelStyle: TextStyle(
                                  fontSize: All.textfieldsize,
                                  color: All.color1,
                                  fontWeight: FontWeight.bold),
                              hintText: "97".tr,
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                            ),
                          ),
                          onTap: () {},
                        ),
                      ),
                    ),
                  ),
                  // زر التحقق
                  Center(
                    child: FadeInDown(
                        duration: All.duration,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child:
                              // تصميم زر
                              CustomButton(
                                  data: "99".tr,
                                  onTap: () {
                                    if (RigesterClass.search == "" ||
                                        RigesterClass.azbaranum.text == "") {
                                      AwesomeDialog(
                                              context: context,
                                              animType: AnimType.scale,
                                              dialogType: DialogType.success,
                                              body: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8.0),
                                                child: Center(
                                                  child: CustomText(
                                                      color: Colors.black,
                                                      data: "101".tr,
                                                      size: All.textsize),
                                                ),
                                              ),
                                              btnCancelColor: Colors.green,
                                              btnCancelText: "105".tr,
                                              btnCancelOnPress: () {})
                                          .show();
                                    } else {
                                    
                                      RigesterClass.check(context);

                                      setState(() {
                                        RigesterClass.search = "98".tr;
                                        RigesterClass.azbaranum.clear();
                                      });
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

// شكل المتحركة
class DrawClip extends CustomClipper<Path> {
  double move = 0;
  double slice = math.pi;
  DrawClip(this.move);
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.8);
    double xCenter =
        size.width * 0.5 + (size.width * 0.6 + 1) * math.sin(move * slice);
    double yCenter = size.height * 0.8 + 69 * math.cos(move * slice);
    path.quadraticBezierTo(xCenter, yCenter, size.width, size.height * 0.8);

    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

// صفحة انشاء طلب
class RigesterForm extends StatelessWidget {
  const RigesterForm({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RigesterControllerImp());

    return GetBuilder<RigesterControllerImp>(
      builder: (controller) => PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: RigesterControllerImp.pageController,
        children: const [Rigester(), Rigester2()],
      ),
    );
  }
}

// انشاء طلب
class Rigester extends StatefulWidget {
  const Rigester({super.key});

  @override
  State<Rigester> createState() => _RigesterState();
}

class _RigesterState extends State<Rigester>
    with SingleTickerProviderStateMixin {
  SignatureController controller = SignatureController();

// صورة شخصية
  Future changeimage() async {
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
            toolbarTitle: '115'.tr,
            toolbarColor: All.color1,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: '115'.tr,
        ),
      ],
    );
    if (croppedFile == null) return;

    setState(() {
      RigesterClass.image = File(croppedFile.path);
    });

    List<int> imageBytes = RigesterClass.image!.readAsBytesSync();

    RigesterClass.imagebyte = base64Encode(imageBytes);
  }

// صورة امامية
  Future frontimage() async {
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
      RigesterClass.front = File(croppedFile.path);
    });

    List<int> imageBytes = RigesterClass.front!.readAsBytesSync();

    RigesterClass.frontbyte = base64Encode(imageBytes);
  }

// صورة خلفية
  Future backimage() async {
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
      RigesterClass.back = File(croppedFile.path);
    });
    List<int> imageBytes = RigesterClass.back!.readAsBytesSync();

    RigesterClass.backbyte = base64Encode(imageBytes);
  }

  clean() {
    setState(() {
      RigesterClass.clean();
    });
  }

  @override
  void initState() {
    clean();
    controller = SignatureController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        //  رجوع
        appBar: AppBar(
          backgroundColor: All.color1,
          elevation: 0,
          centerTitle: true,
          title: CustomText(
              color: Colors.white, data: "103".tr, size: All.textsize),
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: Icon(
              Icons.arrow_back_ios_new,
              size: All.arrowsize,
              color: Colors.white,
            ),
          ),
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Scaffold(
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
                    // صورة شخصية
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: CustomText(
                            color: All.color1,
                            data: "115".tr,
                            size: All.textsize)),
                    Center(
                        child: RigesterClass.image != null
                            ? GestureDetector(
                                onTap: () async {
                                  await changeimage();
                                },
                                child: Container(
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey,
                                            offset: Offset(0.0, 1.0), //(x,y)
                                            blurRadius: 6.0,
                                          )
                                        ]),
                                    child: CircleAvatar(
                                      radius: 110,
                                      backgroundColor: Colors.transparent,
                                      backgroundImage:
                                          FileImage(RigesterClass.image!),
                                    )),
                              )
                            : GestureDetector(
                                onTap: () async {
                                  await changeimage();
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(0.0, 1.0), //(x,y)
                                          blurRadius: 6.0,
                                        )
                                      ]),
                                  width: 200,
                                  height: 200,
                                  child: const Center(
                                      child: Icon(
                                    Icons.camera_alt_rounded,
                                    size: 100,
                                    color: Colors.grey,
                                  )),
                                ),
                              )),

// صورة امامية
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: CustomText(
                            color: All.color1,
                            data: "117".tr,
                            size: All.textsize)),
                    Center(
                      child:
                          // صورة داخل المتحركة

                          RigesterClass.front != null
                              ? GestureDetector(
                                  onTap: () async {
                                    await frontimage();
                                  },
                                  child: Container(
                                    width: Get.width * 0.9,
                                    height: 200,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        image: DecorationImage(
                                            image:
                                                FileImage(RigesterClass.front!),
                                            fit: BoxFit.fill)),
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () async {
                                    await frontimage();
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

// صورة خلفية
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

                          RigesterClass.back != null
                              ? GestureDetector(
                                  onTap: () async {
                                    await backimage();
                                  },
                                  child: Container(
                                    width: Get.width * 0.9,
                                    height: 200,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        image: DecorationImage(
                                            image:
                                                FileImage(RigesterClass.back!),
                                            fit: BoxFit.fill)),
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () async {
                                    await backimage();
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
// زر اكمال التسجيل
                    Center(
                      child: FadeInDown(
                          duration: All.duration,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child:
                                // تصميم زر
                                CustomButton(
                                    data: "116".tr,
                                    onTap: () {
                                      if (RigesterClass.image == null ||
                                          RigesterClass.back == null ||
                                          RigesterClass.front == null) {
                                        AwesomeDialog(
                                                context: context,
                                                animType: AnimType.scale,
                                                dialogType: DialogType.error,
                                                body: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 8.0),
                                                  child: Center(
                                                    child: CustomText(
                                                        color: Colors.black,
                                                        data: "119".tr,
                                                        size: All.textsize),
                                                  ),
                                                ),
                                                btnCancelColor: Colors.green,
                                                btnCancelText: "105".tr,
                                                btnCancelOnPress: () {})
                                            .show();
                                      } else {
                                        RigesterControllerImp().changepage(1);
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
      ),
    );
  }
}

// صفحة انشاء حساب ٢
class Rigester2 extends StatefulWidget {
  const Rigester2({super.key});

  @override
  State<Rigester2> createState() => _Rigester2State();
}

class _Rigester2State extends State<Rigester2>
    with SingleTickerProviderStateMixin {
  SignatureController controller = SignatureController();

  @override
  void initState() {
    controller = SignatureController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        //  رجوع
        appBar: AppBar(
          backgroundColor: All.color1,
          elevation: 0,
          centerTitle: true,
          title: CustomText(
              color: Colors.white, data: "103".tr, size: All.textsize),
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: Icon(
              Icons.arrow_back_ios_new,
              size: All.arrowsize,
              color: Colors.white,
            ),
          ),
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Scaffold(
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
                    // البريد الالكتروني
                    Center(
                      child: FadeInLeft(
                        duration: All.duration,
                        child: Container(
                          width: Get.width * 0.9,
                          margin: const EdgeInsets.only(top: 18),
                          child:
                              // تصميم كتابة النص
                              CustomTextField(
                            controller: RigesterClass.email,
                            hints: '102'.tr,
                            iconData: Icons.email,
                            textInputType: TextInputType.emailAddress,
                            readonly: false,
                          ),
                        ),
                      ),
                    ),
                    // رقم الهاتف
                    Center(
                      child: FadeInRight(
                        duration: All.duration,
                        child: Container(
                          width: Get.width * 0.9,
                          margin: const EdgeInsets.only(top: 18),
                          child:
                              // تصميم كتابة النص
                              CustomTextField(
                            controller: RigesterClass.phone,
                            hints: '47'.tr,
                            iconData: Icons.phone,
                            textInputType: TextInputType.phone,
                            readonly: false,
                          ),
                        ),
                      ),
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //  التوقيع
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: CustomText(
                              color: All.color1,
                              data: "104".tr,
                              size: All.textsize),
                        ),
                        Center(
                            child: Container(
                          width: Get.width * 0.9,
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
                          margin: const EdgeInsets.only(top: 10),
                          child: Signature(
                              backgroundColor: Colors.transparent,
                              height: 200,
                              width: Get.width * 0.9,
                              controller: controller),
                        )),

                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () => controller.clear(),
                                child: Icon(
                                  Icons.clear,
                                  color: Colors.red,
                                  size: All.arrowsize + 5,
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  Uint8List? imageBytes =
                                      await controller.toPngBytes();

                                  RigesterClass.signaturebyte =
                                      base64Encode(imageBytes!);
                                },
                                child: Icon(
                                  Icons.check,
                                  color: Colors.green,
                                  size: All.arrowsize + 10,
                                ),
                              ),
                            ],
                          ),
                        ),
// التعهد
                        FadeInRight(
                            duration: All.duration,
                            child: ListTile(
                              title: CustomText(
                                  color: All.color1,
                                  data: "122".tr,
                                  size: All.textsize),
                              leading: Checkbox(
                                  shape: const CircleBorder(),
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  value: RigesterClass.rigesters,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      RigesterClass.rigesters = value!;
                                    });
                                  }),
                            )),

// زر ارسال طلب
                        Center(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
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
                                                  RigesterControllerImp()
                                                      .changepage(0);
                                                }))),
                                FadeInDown(
                                    duration: All.duration,
                                    child: Container(
                                        width: Get.width / 2.5,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15, horizontal: 10),
                                        child:
                                            // تصميم زر
                                            CustomButton(
                                                data: "121".tr,
                                                onTap: () {
                                                  if (RigesterClass.email.text == "" ||
                                                      RigesterClass
                                                              .phone.text ==
                                                          "" ||
                                                      RigesterClass.rigesters ==
                                                          false 
                                                  ) {
                                                    AwesomeDialog(
                                                            context: context,
                                                            animType:
                                                                AnimType.scale,
                                                            dialogType:
                                                                DialogType
                                                                    .error,
                                                            body: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .symmetric(
                                                                      vertical:
                                                                          8.0),
                                                              child: Center(
                                                                child: CustomText(
                                                                    color: Colors
                                                                        .black,
                                                                    data: "123"
                                                                        .tr,
                                                                    size: All
                                                                        .textsize),
                                                              ),
                                                            ),
                                                            btnCancelColor:
                                                                Colors.green,
                                                            btnCancelText:
                                                                "105".tr,
                                                            btnCancelOnPress:
                                                                () {})
                                                        .show();
                                                  } else {
                                                    RigesterClass.request(
                                                        context);
                                                  }
                                                }))),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
