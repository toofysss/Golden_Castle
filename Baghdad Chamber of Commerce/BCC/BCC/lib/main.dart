import 'package:coldencastle/localization/Transition.dart';
import 'package:coldencastle/localization/changelocal.dart';
import 'package:coldencastle/screen/splashscreen.dart';
import 'package:coldencastle/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialservices();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());
    return GetMaterialApp(
      locale: controller.language,
      translations: MyTransition(),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
