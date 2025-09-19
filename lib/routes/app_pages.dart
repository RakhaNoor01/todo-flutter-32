// lib/routes/app_pages.dart

import 'package:get/get.dart';
import '../pages/login_page.dart';
import '../bindings/login_binding.dart';

import '../pages/home_page.dart';
import '../bindings/home_binding.dart';

import '../pages/dashboard_page.dart';
import '../bindings/dashboard_binding.dart';

import 'app_routes.dart';

class AppPages {
  static const initial = Routes.login;

  static final routes = [
    GetPage(
      name: Routes.login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),

    GetPage(
      name: Routes.home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),

    GetPage(
      name: Routes.dashboard,
      page: () => DashboardPage(),
      binding: DashboardBinding(),
    ),
  ];
}