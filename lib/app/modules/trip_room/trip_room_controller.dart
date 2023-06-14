import 'package:carpooling_o6u_students/app/core/widgets/circular_dialog.dart';
import 'package:carpooling_o6u_students/app/modules/track_location_map/track_location_binidings.dart';
import 'package:carpooling_o6u_students/app/modules/trip_room/widgets/rate_dialog.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../data/services/all_trips.dart';
import '../track_location_map/track_location_map_view.dart';
import 'trip_room_state.dart';

class TripRoomController extends GetxController {
  final TripRoomState state = TripRoomState();

  late String tripId;

  TripRoomController({required this.tripId});

  void getTrips() async {
    state.gettingState.value = !state.gettingState.value;
    var result = await AllTripsServices.getTripRoom(tripId: tripId);
    result.fold(
      (l) {
        print(l);
        state.error.value = l;
        state.gettingState.value = !state.gettingState.value;
      },
      (r) async {
        state.tripRoomModel = r;

        state.startAddress = await getAddress(
            double.parse(
                state.tripRoomModel!.trip!.startLocation!.split(",")[0]),
            double.parse(
                state.tripRoomModel!.trip!.startLocation!.split(",")[1]));
        state.endAddress = await getAddress(
            double.parse(state.tripRoomModel!.trip!.endLocation!.split(",")[0]),
            double.parse(
                state.tripRoomModel!.trip!.endLocation!.split(",")[1]));
        // print(tripsModel!.trips!.first.driverPhoto!);
        state.gettingState.value = !state.gettingState.value;
      },
    );
  }

  Future<String> getAddress(double latitude, double longitude) async {
    final List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);

    if (placemarks != null && placemarks.isNotEmpty) {
      final Placemark placemark = placemarks[0];
      final String address =
          '${placemark.name},${placemark.administrativeArea}';

      return address;
    } else {
      return "No address found";
    }
  }

  void sendRequest() async {
    if (state.tripRoomModel!.trip!.state == 'start') {
      Get.to(
        TrackLocationMapComponent(),
        binding: TrackLocationBindings(
          startLocation: LatLng(
            double.parse(
                state.tripRoomModel!.trip!.startLocation!.split(",")[0]),
            double.parse(
              state.tripRoomModel!.trip!.startLocation!.split(",")[1],
            ),
          ),
          endLocation: LatLng(
            double.parse(
                state.tripRoomModel!.trip!.endLocation!.split(",")[0]),
            double.parse(
              state.tripRoomModel!.trip!.endLocation!.split(",")[1],
            ),
          ),
        ),
      );
      // Get.dialog(RateingDialog());
    } else {
      Get.dialog(CircularDialog(), barrierDismissible: false);
      var result = await AllTripsServices.startRide(tripId: tripId);
      result.fold(
        (l) {
          Get.back();
          Get.snackbar("Error", '$l');
        },
        (r) async {
          Get.back();
          getTrips();
          await Get.dialog(
            InfoDialog(
              error: 'you are on track!',
              title: Icons.check,
            ),
          );
          Get.to(
            TrackLocationMapComponent(),
            binding: TrackLocationBindings(
              startLocation: LatLng(
                double.parse(
                    state.tripRoomModel!.trip!.startLocation!.split(",")[0]),
                double.parse(
                  state.tripRoomModel!.trip!.startLocation!.split(",")[1],
                ),
              ),
              endLocation: LatLng(
                double.parse(
                    state.tripRoomModel!.trip!.endLocation!.split(",")[0]),
                double.parse(
                  state.tripRoomModel!.trip!.endLocation!.split(",")[1],
                ),
              ),
            ),
          );
        },
      );
    }
  }

  void endTrip() async {
    Get.back();
    Get.dialog(CircularDialog(), barrierDismissible: false);
    var result = await AllTripsServices.endRide(tripId: tripId);
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
            error: 'The ride is Done',
            title: Icons.check,
          ),
        );
      },
    );
  }

  callNumber(String phone) async {
    const number = '01033953634'; //set the number here
    var res = await FlutterPhoneDirectCaller.callNumber(phone);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getTrips();
  }
}
