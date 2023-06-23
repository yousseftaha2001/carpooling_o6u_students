import 'dart:async';
import 'dart:convert';

import 'package:carpooling_o6u_students/app/core/widgets/circular_dialog.dart';
import 'package:carpooling_o6u_students/app/data/services/all_trips.dart';
import 'package:carpooling_o6u_students/app/modules/trip_room/trip_room_controller.dart';
import 'package:carpooling_o6u_students/app/modules/trip_room/widgets/rate_dialog.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'track_location_map_state.dart';

class TrackLocationMapController extends GetxController {
  final TrackLocationMapState state = TrackLocationMapState();
  late String tripId;
  late LatLng startLocation;
  late LatLng endLocation;
  final LocationSettings locationSettings = LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 1,
  );

  TrackLocationMapController({
    required this.startLocation,
    required this.endLocation,
    required this.tripId,
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

  void addCustomIcon() async {
    await BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(), "assets/carmarker.png")
        .then(
      (icon) {
        state.markerIcon = icon;
      },
    );
  }

  void addMarker({required String markerId, required LatLng location}) {
    state.myMarkers.add(
      Marker(
        markerId: MarkerId('$markerId'),
        position: LatLng(location.latitude, location.longitude),
        infoWindow: InfoWindow(title: '$markerId'),
        icon: markerId == 'My Location'
            ? BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue)
            : BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      ),
    );
  }

  void changeCamera({required LatLng latLng, required String id}) async {
    //  final GoogleMapController controller =  controller.;
    addMarker(
      location: latLng,
      markerId: id,
    );
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

      state.userLocation.value = LatLng(location.latitude, location.longitude);

      update(['map']);

      changeCamera(latLng: state.userLocation.value!, id: 'My Location');
      // drawPoly();
      return location;
    } catch (e) {}
  }

  bool clacDistance() {
    var reulst = Geolocator.distanceBetween(
      state.userLocation.value!.latitude,
      state.userLocation.value!.longitude,
      endLocation.latitude,
      endLocation.longitude,
    );
    return reulst <= 100;
  }

  void endTripFunction() async {
    Get.dialog(RateingDialog());
    // if(clacDistance()){
    //   endTrip();
    // }else{
    //   endTripAc();
    // }
  }

  void ending() {
    if (clacDistance()) {
      endTrip();
    } else {
      endTripAc();
    }
  }

  void endTrip() async {
    Get.back();
    Get.dialog(CircularDialog(), barrierDismissible: false);
    TripRoomController controller = Get.find();

    List item = List.generate(
        controller.state.rates.length,
        (index) => {
              'id': controller.state.rates[index].id.toString(),
              'new_rate': controller.state.rates[index].rate
            });
    var json = {
      'items': jsonEncode(item),
    };
    var result = await AllTripsServices.endRide(tripId: tripId, json: json);
    result.fold(
      (l) {
        Get.back();
        Get.snackbar("Error", '$l');
      },
      (r) async {
        Get.back();
        TripRoomController controller = Get.find<TripRoomController>();
        await controller.getTrips();
        await Get.dialog(
          InfoDialog(
            error: 'The ride is Done',
            title: Icons.check,
          ),
        );
        Get.back();
      },
    );
  }

  void endTripAc() async {
    // Get.back();
    Get.dialog(CircularDialog(), barrierDismissible: false);
    TripRoomController controller = Get.find();

    List item = List.generate(
        controller.state.rates.length,
            (index) => {
          'id': controller.state.rates[index].id.toString(),
          'new_rate': controller.state.rates[index].rate
        });
    var json = {
      'items': jsonEncode(item),
    };
    var result = await AllTripsServices.endRideWtihAc(tripId: tripId,json: json);
    result.fold(
      (l) {
        Get.back();
        Get.snackbar("Error", '$l');
      },
      (r) async {
        Get.back();
        TripRoomController controller = Get.find<TripRoomController>();
        await controller.getTrips();
        await Get.dialog(
          InfoDialog(
            error: 'The ride is Done',
            title: Icons.check,
          ),
        );
        Get.back();
      },
    );
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getLoction();

    changeCamera(
      id: 'start Point',
      latLng: startLocation,
    );
    changeCamera(
      id: 'End Point',
      latLng: endLocation,
    );

    StreamSubscription<Position> positionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((Position? position) {
      // do what you want to do with the position here
      print("hello");
      state.userLocation.value = LatLng(position!.latitude, position.longitude);

      changeCamera(
        latLng: state.userLocation.value!,
        id: 'My Location',
      );
      update(['map']);
    });
    addCustomIcon();
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
