import 'package:get/get.dart';

import 'trip_room_controller.dart';

class TripRoomBinding extends Bindings {
  late String tripId;

  TripRoomBinding({required this.tripId});

  @override
  void dependencies() {
    Get.lazyPut(() => TripRoomController(tripId: tripId));
  }
}
