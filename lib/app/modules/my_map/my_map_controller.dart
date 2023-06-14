import 'dart:async';

import 'package:carpooling_o6u_students/app/modules/create_trip/create_trip_controller.dart';
import 'package:carpooling_o6u_students/app/modules/my_map/map.services.dart';
import 'package:carpooling_o6u_students/app/modules/signup/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/widgets/circular_dialog.dart';
import 'models/AutoCompleteRe.dart';

class MyMapController extends GetxController {
  //TODO: Implement MyMapController.

  late String destination;

  RxBool searchMode = false.obs;
  RxBool getLocations = false.obs;
  AutoCompleteRe? autoCompleteRel;

  MyMapController({required this.destination});

  Rxn<LatLng?> userLocation = Rxn();
  final Completer<GoogleMapController> controller =
  Completer<GoogleMapController>();
  late GoogleMapController googleMapController;
  List<Marker> myMarkers = [
    // Marker(
    //     markerId: MarkerId('s'),
    //     position: LatLng(30.030343690255602, 30.99610329155613)),
    // Marker(
    //     markerId: MarkerId('d'),
    //     position: LatLng(29.97646878187448, 30.94739929101225)),
  ];
  TextEditingController searchController = TextEditingController();
  MapServices mapServices = MapServices();

  void changeLocationFromSearch(String placeid) async {
    Get.dialog(CircularDialog(), barrierDismissible: false);
    var result = await mapServices.getLocation(placeId: placeid);
    result.fold(
          (l) {
        Get.back();
        Get.snackbar("Error", 'please try again');
      },
          (r) {
            Get.back();
            searchController.clear();
            searchMode.value = false;
            autoCompleteRel = null;
            FocusScopeNode currentFocus = FocusScope.of(Get.context!);
            currentFocus.unfocus();
            print(r.result!.geometry!.location!.lat!);
        changeCamera(LatLng(r.result!.geometry!.location!.lat!,
            r.result!.geometry!.location!.lng!), 'My Location');
      },
    );
  }

  void search() async {
    getLocations.value = !getLocations.value;
    var resullt =
    await mapServices.searchAboutLocation(title: searchController.text);
    resullt.fold(
          (l) {},
          (r) {
        autoCompleteRel = r;
      },
    );
    getLocations.value = !getLocations.value;
  }

  final LocationSettings locationSettings = LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100,
  );

  @override
  void onInit() {
    super.onInit();
    searchController.addListener(() {
      if (searchController.text.isNotEmpty) {
        searchMode.value = true;
        search();
      } else {
        searchMode.value = false;
      }
    });
    getLoction();
    // drawPoly();
    StreamSubscription<Position> positionStream =
    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((Position? position) {
      // do what you want to do with the position here
      print("hello");
      userLocation.value = LatLng(position!.latitude, position.longitude);

      update(['map']);

      changeCamera(userLocation.value!, 'My Location');
    });
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
          zoom: 15,
        ),
      ),
    );
    userLocation.value = latLng;
    update(['map']);
  }

  List<LatLng> polylines = [];

  void drawPoly() async {
    PolylinePoints polylinePoints = PolylinePoints();
    var result = await polylinePoints.getRouteBetweenCoordinates(
      'AIzaSyBeBZvw0OrddEetTPbqVu4fyOXNYC5aT-U',
      PointLatLng(30.030343690255602, 30.99610329155613),
      PointLatLng(29.97646878187448, 30.94739929101225),
    );
    // result.points.
    if (result.points.isNotEmpty) {
      print("objects");
      result.points.forEach((p) {
        polylines.add(
          LatLng(p.latitude, p.longitude),
        );
      });
      update(['map']);
      // setState(() {});
    }
    print("${result.points.length.toString()}+asas");
    print(result.errorMessage);
  }

  getLoction() async {
    try {
      var location = await determinePosition();

      userLocation.value = LatLng(location.latitude!, location.longitude!);

      update(['map']);

      changeCamera(userLocation.value!, 'My Location');
      // drawPoly();
      return location;
    } catch (e) {}
  }


  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
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
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    // Geolocator.getPositionStream()

    return await Geolocator.getCurrentPosition();
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
