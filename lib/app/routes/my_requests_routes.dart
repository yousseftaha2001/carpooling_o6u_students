import 'package:get/get.dart';

import '../modules/my_requests/my_requests_binding.dart';
import '../modules/my_requests/my_requests_page.dart';

class MyRequestsRoutes {
  MyRequestsRoutes._();

  static const myRequests = '/my-requests';

  static final routes = [
    GetPage(
      name: myRequests,
      page: () =>  MyRequestsPage(),
      binding: MyRequestsBinding(),
    ),
  ];
}
