import 'package:get/get.dart';
import '../routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashscreenController extends GetxController{
  var isMobile = true.obs;

  void updateLayout(double width) {
    isMobile.value = width < 600;
  }

@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // cek if username is stored
    checkLogin();
  }

  checkLogin() async {
    await Future.delayed(Duration(seconds: 1));
    final prefs = await SharedPreferences.getInstance();
    final savedUsername = prefs.getString("username");
    if (savedUsername != null && savedUsername.isNotEmpty) {
      // sudah login
      Get.offAllNamed(Routes.login);
    } else {
      // belum login
      Get.offAllNamed(Routes.login); 
    }
  }
}