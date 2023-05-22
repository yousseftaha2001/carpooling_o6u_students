import 'dart:async';

import 'package:carpooling_o6u_students/app/modules/create_trip/create_trip_controller.dart';
import 'package:carpooling_o6u_students/app/modules/my_map/map.services.dart';
import 'package:carpooling_o6u_students/app/modules/signup/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MyMapController extends GetxController {
  //TODO: Implement MyMapController.

  late String destination;
  MyMapController({required this.destination});

  Rxn<LatLng?> userLocation = Rxn();
  final Completer<GoogleMapController> controller =
      Completer<GoogleMapController>();
  late GoogleMapController googleMapController;
  List<Marker> myMarkers = [];
  TextEditingController searchController = TextEditingController();
  MapServices mapServices = MapServices();
  

  void search() async {
    await mapServices.searchAboutLocation(title: searchController.text);
  }

  @override
  void onInit() {
    super.onInit();
    getLoction();
    
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void addMarker({required String markerId, required LatLng location}) {
    myMarkers.add(
      Marker(
        markerId: MarkerId('$markerId'),
        position: LatLng(location.latitude, location.longitude),
        infoWindow: InfoWindow(title: '$markerId'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      ),
    );
  }

  void changeCamera(LatLng latLng, String id) async {
    //  final GoogleMapController controller =  controller.;
    addMarker(location: latLng, markerId: id);
    googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(latLng.latitude, latLng.longitude),
          zoom: 14.4746,
        ),
      ),
    );
    userLocation.value = latLng;
    update(['map']);
  }

  getLoction() async {
    try {
      Location location = Location();

      bool? _serviceEnabled;
      PermissionStatus? _permissionGranted;
      LocationData locationData;

      _serviceEnabled = await location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
        if (!_serviceEnabled) {
          return;
        }
      }

      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          return;
        }
      }

      locationData = await location.getLocation();
      // print(locationData.latitude);
      userLocation.value =
          LatLng(locationData.latitude!, locationData.longitude!);
      // updateCamera(LatLng(locationData.latitude!, locationData.longitude!));

      update(['map']);
      print(locationData.accuracy);
      changeCamera(userLocation.value!, 'My Location');
      // drawPoly();
      return locationData;
    } catch (e) {}
  }

  void continueButton() {
    if (destination == 'signUp') {
      SignupController signupController = Get.find();
      signupController.studentLocation = userLocation.value!;
      signupController.startSignup();
    } else if (destination == 'createTrip') {
      CreateTripController createTripController =
          Get.find<CreateTripController>();
      createTripController.startLocation.text =
          '${userLocation.value!.latitude},${userLocation.value!.longitude}';
      Get.back();
    }
  }
}
