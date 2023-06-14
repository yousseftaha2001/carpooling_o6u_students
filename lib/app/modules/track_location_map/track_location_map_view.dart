import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'track_location_map_controller.dart';

class TrackLocationMapComponent extends StatefulWidget {
  const TrackLocationMapComponent({Key? key}) : super(key: key);

  @override
  State<TrackLocationMapComponent> createState() =>
      _TrackLocationMapComponentState();
}

class _TrackLocationMapComponentState extends State<TrackLocationMapComponent> {
  final controller = Get.find<TrackLocationMapController>();
  final state = Get.find<TrackLocationMapController>().state;
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TrackLocationMapController>(
      id: "map",
      builder: (contro) {
        return GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          markers: Set<Marker>.of(state.myMarkers),
          onMapCreated: (GoogleMapController controller) {
            state.controller.complete(controller);
            state.googleMapController = controller;
          },
          onTap: (argument) {
            // controller.changeCamera(la argument, 'My Location');
          },
        );
      },
    );
  }

  @override
  void dispose() {
    Get.delete<TrackLocationMapController>();
    super.dispose();
  }
}
