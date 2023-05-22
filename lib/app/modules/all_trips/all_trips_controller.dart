import 'package:carpooling_o6u_students/app/core/widgets/circular_dialog.dart';
import 'package:carpooling_o6u_students/app/data/models/trips_model.dart';
import 'package:carpooling_o6u_students/app/data/services/all_trips.dart';
import 'package:geocoding/geocoding.dart';

// import 'package:geocoder2/geocoder2.dart';
import 'package:get/get.dart';
// import 'package:location_geocoder/location_geocoder.dart';

class AllTripsController extends GetxController {
  //TODO: Implement AllTripsController.

  RxBool gettingState = false.obs;
  RxString error = ''.obs;
  TripsModel? tripsModel;

  void getTrips() async {
    gettingState.value = !gettingState.value;
    var result = await AllTripsServices.getAllTrips();
    result.fold(
      (l) {
        print(l);
        error.value = l;
        gettingState.value = !gettingState.value;
      },
      (r) async {
        print("h");
        tripsModel = r;
        for (var i = 0; i < tripsModel!.trips!.length; i++) {
          tripsModel!.trips![i].startLocation = await getAddress(
              double.parse(tripsModel!.trips![i].startLocation!.split(",")[0]),
              double.parse(tripsModel!.trips![i].startLocation!.split(",")[1]));
          tripsModel!.trips![i].endLocation = await getAddress(
              double.parse(tripsModel!.trips![i].endLocation!.split(",")[0]),
              double.parse(tripsModel!.trips![i].endLocation!.split(",")[1]));
        }
        print(tripsModel!.trips!.first.driverPhoto!);
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

  void sendRequest({required String id}) async {
    Get.dialog(CircularDialog(), barrierDismissible: false);
    var result = await AllTripsServices.sendRequest(tripId: id);
    result.fold(
      (l) {
        Get.back();
        Get.snackbar("Error", '$l');
      },
      (r) {
        Get.back();
        Get.snackbar("Done", "Yor request has been sent");
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    // getAdd();
    // 29.976431752196323, 30.947395821325607
    // getAddress(29.976431752196323, 30.947395821325607);
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
