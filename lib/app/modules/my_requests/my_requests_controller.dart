import 'package:carpooling_o6u_students/app/core/widgets/circular_dialog.dart';
import 'package:carpooling_o6u_students/app/data/models/my_requests.dart';
import 'package:carpooling_o6u_students/app/data/services/all_trips.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';

class MyRequestsController extends GetxController {
  //TODO: Implement MyRequestsController.
    RxBool gettingState = false.obs;
  RxString error = ''.obs;
  MyRequests? requests;

  void endTrip(String reqId) async {
    // Get.back();
    // print(reqId);
    Get.dialog(CircularDialog(), barrierDismissible: false);
    var result = await AllTripsServices.rideTrip(tripId: reqId);
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
          requests!.requets![i].startLocation = await getAddress(
              double.parse(requests!.requets![i].startLocation!.split(",")[0]),
              double.parse(requests!.requets![i].startLocation!.split(",")[1]));
          requests!.requets![i].endLocation = await getAddress(
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
