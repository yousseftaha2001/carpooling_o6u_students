import 'package:get/get.dart';

import 'ride_requests_controller.dart';

class RideRequestsBinding extends Bindings {

  late String tripId;


  RideRequestsBinding({required this.tripId});

  @override
  void dependencies() {
    // Get.lazyPut(() => RideRequestsController());
    Get.put(RideRequestsController(tripId: tripId));
  }
}
