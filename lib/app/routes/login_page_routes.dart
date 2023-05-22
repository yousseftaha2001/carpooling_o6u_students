import 'package:get/get.dart';

import '../modules/login_page/login_page_binding.dart';
import '../modules/login_page/login_page_page.dart';

class LoginPageRoutes {
  LoginPageRoutes._();

  static const loginPage = '/login-page';

  static final routes = [
    GetPage(
      name: loginPage,
      page: () =>  LoginPagePage(),
      binding: LoginPageBinding(),
    ),
  ];
}
