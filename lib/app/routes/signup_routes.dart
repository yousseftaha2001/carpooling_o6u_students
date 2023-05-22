import 'package:get/get.dart';

import '../modules/signup/signup_binding.dart';
import '../modules/signup/signup_page.dart';

class SignupRoutes {
  SignupRoutes._();

  static const signup = '/signup';

  static final routes = [
    GetPage(
      name: signup,
      page: () =>  SignupPage(),
      binding: SignupBinding(),
    ),
  ];
}
