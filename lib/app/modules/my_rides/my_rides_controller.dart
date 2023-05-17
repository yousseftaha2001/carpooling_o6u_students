import 'package:carpooling_o6u_students/app/data/services/all_trips.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';

import 'my_rides_state.dart';

class MyRidesController extends GetxController {
  final MyRidesState state = MyRidesState();
  void getTrips() async {
    state.gettingState.value = !state.gettingState.value;
    var result = await AllTripsServices.myTrips();
    result.fold(
          (l) {
        print(l);
        state.error.value = l;
        state.gettingState.value = !state.gettingState.value;
      },
          (r) async {
        print("h");
        state.tripsModel = r;
        for (var i = 0; i < state.tripsModel!.trips!.length; i++) {
          state.tripsModel!.trips![i].startLocation = await getAddress(
              double.parse(state.tripsModel!.trips![i].startLocation!.split(",")[0]),
              double.parse(state.tripsModel!.trips![i].startLocation!.split(",")[1]));
          state.tripsModel!.trips![i].endLocation = await getAddress(
              double.parse(state.tripsModel!.trips![i].endLocation!.split(",")[0]),
              double.parse(state.tripsModel!.trips![i].endLocation!.split(",")[1]));
        }
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
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getTrips();
  }
}
