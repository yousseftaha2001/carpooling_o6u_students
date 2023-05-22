import 'package:get/get.dart';

import '../modules/create_trip/create_trip_binding.dart';
import '../modules/create_trip/create_trip_page.dart';

class CreateTripRoutes {
  CreateTripRoutes._();

  static const createTrip = '/create-trip';

  static final routes = [
    GetPage(
      name: createTrip,
      page: () =>  CreateTripPage(),
      binding: CreateTripBinding(),
    ),
  ];
}
