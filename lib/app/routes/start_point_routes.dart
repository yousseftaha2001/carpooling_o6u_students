import 'package:get/get.dart';

import '../modules/start_point/start_point_binding.dart';
import '../modules/start_point/start_point_page.dart';

class StartPointRoutes {
  StartPointRoutes._();

  static const startPoint = '/start-point';

  static final routes = [
    GetPage(
      name: startPoint,
      page: () =>  StartPointPage(),
      binding: StartPointBinding(),
    ),
  ];
}
