import 'package:get/get.dart';

import '../modules/my_map/my_map_binding.dart';
import '../modules/my_map/my_map_page.dart';

class MyMapRoutes {
  MyMapRoutes._();

  static const myMap = '/my-map';

  static final routes = [
    GetPage(
      name: myMap,
      page: () =>  MyMapPage(),
      binding: MyMapBinding(),
    ),
  ];
}
