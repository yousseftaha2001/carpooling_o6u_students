import 'package:carpooling_o6u_students/app/data/services/all_trips.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';

import '../../core/widgets/circular_dialog.dart';
import 'ride_requests_state.dart';

class RideRequestsController extends GetxController {
  final RideRequestsState state = RideRequestsState();
  late String tripId;

  RideRequestsController({required this.tripId});

  void getData() async {
    state.gettingState.value = !state.gettingState.value;
    var result = await AllTripsServices.getRideRequests(tripId: tripId);
    result.fold(
      (l) {
        print(l);
        state.error.value = l;
        state.gettingState.value = !state.gettingState.value;
      },
      (r) async {
        print("h");
        state.requests = r;
        printInfo(info: state.requests!.requets!.length.toString());
        // for (var i = 0; i < state.requests!.requets!.length; i++) {
        //   state.requests!.requets![i].startLocation = await getAddress(
        //       double.parse(requests!.requets![i].startLocation!.split(",")[0]),
        //       double.parse(requests!.requets![i].startLocation!.split(",")[1]));
        //   requests!.requets![i].endLocation = await getAddress(
        //       double.parse(requests!.requets![i].endLocation!.split(",")[0]),
        //       double.parse(requests!.requets![i].endLocation!.split(",")[1]));
        // }
        state.gettingState.value = !state.gettingState.value;
      },
    );
  }

  void acceptRequest({required int index}) async {
    Get.dialog(CircularDialog(), barrierDismissible: false);
    var result = await AllTripsServices.changeRequestState(
      tripId: tripId.toString(),
      uid: state.requests!.requets![index].uId!.toString(),
      requestId: state.requests!.requets![index].id!.toString(),
      state: "accepted",
    );
    result.fold(
      (l) {
        print("$l");
        Get.back();
        Get.dialog(InfoDialog(error: l.toString(), title: "Error"));
      },
      (r) {
        Get.back();
        Get.dialog(InfoDialog(error: r, title: "Done"));
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
    getData();
  }
}
