import 'package:get/get.dart';

import 'all_trips_controller.dart';

class AllTripsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllTripsController>(
      () => AllTripsController(),
    );
  }
}
