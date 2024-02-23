import 'package:flutter_demo/login_page.dart';
import 'package:get/get.dart';

import '../bindings/binding.dart';
import '../view/home_view.dart';
import 'app_routs.dart';

class AppPages {
  AppPages._();
  static const initial = Routes.home;
  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => AuthPage(),
      binding: HomeBinding(),
    ),
  ];
}
class Routes {
  Routes._();
  static const home = _Paths.home;
  static const auth = _Paths.auth;
}

abstract class _Paths {
  static const home = '/home';
  static const auth = '/auth';
}
