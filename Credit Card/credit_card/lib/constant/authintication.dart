import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

class AuthinticationClass {
  static final auth = LocalAuthentication();

  static Future<bool> canauth() async {
    try {
      bool canCheck = await auth.canCheckBiometrics;
      bool isSupported = await auth.isDeviceSupported();

      return canCheck && isSupported;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> fingureauth() async {
    try {
      if (!await canauth()) return false;
      return await auth.authenticate(
        localizedReason: '47'.tr,
        options: const AuthenticationOptions(useErrorDialogs: true),
      );
    } catch (e) {
      return false;
    }
  }
}
