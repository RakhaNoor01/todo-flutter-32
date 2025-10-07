import 'package:get/get.dart';

class ProfileController extends GetxController {
  var isMobile = true.obs;

  void updateLayout(double width) {
    isMobile.value = width < 600;
  }
}
