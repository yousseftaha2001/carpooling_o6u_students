import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'track_location_map_state.dart';

class TrackLocationMapController extends GetxController {
  final TrackLocationMapState state = TrackLocationMapState();
  late LatLng startLocation;
  late LatLng endLocation;
  final LocationSettings locationSettings = LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100,
  );

  TrackLocationMapController({
    required this.startLocation,
    required this.endLocation,
  });

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  void addMarker({required String markerId, required LatLng location}) {
    state.myMarkers.add(
      Marker(
        markerId: MarkerId('$markerId'),
        position: LatLng(location.latitude, location.longitude),
        infoWindow: InfoWindow(title: '$markerId'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      ),
    );
  }

  void changeCamera({required LatLng latLng,required String id}) async {
    //  final GoogleMapController controller =  controller.;
    addMarker(location: latLng, markerId: id);
    state.googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(latLng.latitude, latLng.longitude),
          zoom: 15,
        ),
      ),
    );
    state.userLocation.value = latLng;
    update(['map']);
  }

  getLoction() async {
    try {
      var location = await determinePosition();

      state.userLocation.value =
          LatLng(location.latitude, location.longitude);

      update(['map']);

      changeCamera(latLng: state.userLocation.value!,id: 'My Location');
      // drawPoly();
      return location;
    } catch (e) {}
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getLoction();
    changeCamera(id: 'start Point', latLng: startLocation);
    changeCamera(id: 'End Point', latLng: endLocation);

    StreamSubscription<Position> positionStream =
    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((Position? position) {
      // do what you want to do with the position here
      print("hello");
      state.userLocation.value = LatLng(position!.latitude, position.longitude);



      changeCamera(latLng:state.userLocation.value!,id: 'My Location');
      update(['map']);
    });
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
