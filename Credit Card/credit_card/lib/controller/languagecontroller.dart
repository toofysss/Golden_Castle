import 'package:credit_card/constant/language.dart';
import 'package:credit_card/localization/changelocal.dart';
import 'package:get/get.dart';
import 'package:restart_app/restart_app.dart';

// تغيير صفحات
abstract class LanguageController extends GetxController {
  changepage(String currentPage, String values);
}

class LanguageControllerImp extends LanguageController {
  @override
  changepage(String currentPage, String values) {
    LocalController myServices = Get.put(LocalController());
    myServices.changeLang(currentPage);
    LanguageClass.lang.text = values;
    Restart.restartApp();
  }
}
