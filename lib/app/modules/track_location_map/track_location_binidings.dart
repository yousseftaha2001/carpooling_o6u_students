import 'package:carpooling_o6u_students/app/modules/track_location_map/track_location_map_controller.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackLocationBindings extends Bindings {
  late LatLng startLocation;
  late LatLng endLocation;
  late String tripId;

  TrackLocationBindings({
    required this.startLocation,
    required this.endLocation,
    required this.tripId,
  });

  @override
  void dependencies() {
    Get.put(
      TrackLocationMapController(
        startLocation: startLocation,
        endLocation: endLocation,
        tripId: tripId,
      ),
    );
  }
}
