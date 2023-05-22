import 'home_routes.dart';
// import 'login_routes.dart';
import 'login_page_routes.dart';
import 'signup_routes.dart';
import 'my_map_routes.dart';
import 'start_point_routes.dart';
import 'create_trip_routes.dart';
import 'all_trips_routes.dart';
import 'my_requests_routes.dart';


class AppPages {
  AppPages._();

  static const INITIAL = '/home';

  static final routes = [
    ...HomeRoutes.routes,

		// ...LoginRoutes.routes,
		...LoginPageRoutes.routes,
		...SignupRoutes.routes,
		...MyMapRoutes.routes,
		...StartPointRoutes.routes,
		...CreateTripRoutes.routes,
		...AllTripsRoutes.routes,
		...MyRequestsRoutes.routes,
  ];
}
