import 'package:get/get.dart';

import '../../data/models/TripsModel.dart';

class MyRidesState {
  MyRidesState() {
    ///Initialize variables
  }


  RxBool gettingState = false.obs;
  RxString error = ''.obs;
  TripsModel? tripsModel;
  RxBool allTrips=true.obs;
}
