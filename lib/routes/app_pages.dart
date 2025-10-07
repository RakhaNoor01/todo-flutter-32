// lib/routes/app_pages.dart

import 'package:get/get.dart';
import '../pages/login_page.dart';
import '../bindings/login_binding.dart';

import '../pages/home_page.dart';
import '../bindings/home_binding.dart';

import '../pages/dashboard_page.dart';
import '../bindings/dashboard_binding.dart';

import '../pages/add_todo_page.dart';
import '../bindings/add_todo_binding.dart';

import '../pages/edit_todo_page.dart';
import '../bindings/edit_todo_binding.dart';

import '../pages/splash_screen_page.dart';
import '../bindings/splash_screen_binding.dart';

import '../pages/profile_page.dart';
import '../bindings/profile_binding.dart';

import 'app_routes.dart';

class AppPages {
  static const initial = Routes.splashScreen;

  static final pages = [
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
    GetPage(
      name: Routes.addTodo,
      page: () => AddTodoPage(),
      binding: AddTodoBinding(),
    ),
    
    GetPage(
      name: Routes.editTodo,
      page: () => EditTodoPage(),
      binding: EditTodoBinding(),
    ),
    GetPage(
      name: Routes.splashScreen,
      page: () => SplashScreenPage(),
      binding: SplashscreenBinding(),
    ),
    GetPage(
      name: Routes.profile,
      page: () => ProfilePage(),
      binding: ProfileBinding(),
    ),
  ];
}
