import 'dart:async';

import 'package:carpooling_o6u_students/app/modules/my_map/map.services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackLocationMapState {
  TrackLocationMapState() {
    ///Initialize variables
  }
  Rxn<LatLng?> userLocation = Rxn();
  final Completer<GoogleMapController> controller =
  Completer<GoogleMapController>();
  late GoogleMapController googleMapController;
  List<Marker> myMarkers = [

  ];
  MapServices mapServices = MapServices();
}
