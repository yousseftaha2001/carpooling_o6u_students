import 'package:get/get.dart';

import '../modules/all_trips/all_trips_binding.dart';
import '../modules/all_trips/all_trips_page.dart';

class AllTripsRoutes {
  AllTripsRoutes._();

  static const allTrips = '/all-trips';

  static final routes = [
    GetPage(
      name: allTrips,
      page: () =>  AllTripsPage(),
      binding: AllTripsBinding(),
    ),
  ];
}
