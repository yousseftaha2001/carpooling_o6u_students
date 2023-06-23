import 'dart:convert';

import 'package:carpooling_o6u_students/app/core/widgets/circular_dialog.dart';
import 'package:carpooling_o6u_students/app/data/models/MyRequests.dart';

import 'package:carpooling_o6u_students/app/data/services/all_trips.dart';
import 'package:carpooling_o6u_students/app/modules/trip_room/trip_room_state.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class MyRequestsController extends GetxController {
  RxBool gettingState = false.obs;
  RxString error = ''.obs;
  MyRequests? requests;
  String? startAd;
  String? endAd;
  RateModel? driver;

  double clacDistance(Requets t) {
    // String endLat=''
    if (t.ridePoint != null) {
      var endLat = double.parse(t.endLocation!.split(",")[0]);
      var endLong = double.parse(t.endLocation!.split(",")[1]);
      var pickLar = double.parse(t.ridePoint!.split(",")[0]);
      var pickLong = double.parse(t.ridePoint!.split(",")[1]);
      var result = Geolocator.distanceBetween(
        endLat,
        endLong,
        pickLar,
        pickLong,
      );
      return result / 1024;
    } else {
      return 0;
    }
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

  void endTrip(String reqId) async {
    // Get.back();
    // print(reqId);
    Get.dialog(CircularDialog(), barrierDismissible: false);
    var result2 = await determinePosition();
    var json = {'ride_point': '${result2.latitude},${result2.longitude}'};
    var result = await AllTripsServices.rideTrip(tripId: reqId, json: json);
    result.fold(
      (l) {
        Get.back();
        Get.snackbar("Error", '$l');
      },
      (r) {
        Get.back();
        getTrips();
        Get.dialog(
          InfoDialog(
            error: 'You are in!!!',
            title: Icons.check,
          ),
        );
      },
    );
  }

  void rateDriver({String? id,int? rate}) async {
    Get.back();

    Get.dialog(CircularDialog(), barrierDismissible: false);

    var json = {
      'items': jsonEncode([{
        'id': id,
        'new_rate': rate
      }]),
    };

    var result = await AllTripsServices.rateDriver(json: json);
    result.fold(
      (l) {
        if(Get.isSnackbarOpen){
          Get.back();
        }
        Get.back();
        // Get.back();
        Get.snackbar("Error", '$l');
      },
      (r) {
        Get.back();
        getTrips();
        Get.dialog(
          InfoDialog(
            error: 'your rate has been sent!',
            title: Icons.check,
          ),
        );
      },
    );
  }

  void getTrips() async {
    gettingState.value = !gettingState.value;
    var result = await AllTripsServices.getMyRequests();
    result.fold(
      (l) {
        print(l);
        error.value = l;
        gettingState.value = !gettingState.value;
      },
      (r) async {
        print("h");
        requests = r;
        for (var i = 0; i < requests!.requets!.length; i++) {
          startAd = await getAddress(
              double.parse(requests!.requets![i].startLocation!.split(",")[0]),
              double.parse(requests!.requets![i].startLocation!.split(",")[1]));
          endAd = await getAddress(
              double.parse(requests!.requets![i].endLocation!.split(",")[0]),
              double.parse(requests!.requets![i].endLocation!.split(",")[1]));
        }
        gettingState.value = !gettingState.value;
      },
    );
  }

  Future<String> getAddress(double latitude, double longitude) async {
    final List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);

    if (placemarks != null && placemarks.isNotEmpty) {
      final Placemark placemark = placemarks[1];
      final String address =
          '${placemark.name},${placemark.subAdministrativeArea}';

      return address;
    } else {
      return "No address found";
    }
  }

  @override
  void onInit() {
    super.onInit();
    getTrips();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
