import 'package:get/get.dart';
import '../controllers/splash_screen_controller.dart';

class SplashscreenBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<SplashscreenController>(() => SplashscreenController());
  }
  
}