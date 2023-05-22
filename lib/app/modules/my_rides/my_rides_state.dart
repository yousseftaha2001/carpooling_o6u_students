import 'package:carpooling_o6u_students/app/data/models/trips_model.dart';
import 'package:get/get.dart';

class MyRidesState {
  MyRidesState() {
    ///Initialize variables
  }


  RxBool gettingState = false.obs;
  RxString error = ''.obs;
  TripsModel? tripsModel;
  RxBool allTrips=true.obs;
}
