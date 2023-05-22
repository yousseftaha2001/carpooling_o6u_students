import 'package:carpooling_o6u_students/app/data/models/TripRoomModel.dart';
import 'package:get/get.dart';

class TripRoomState {
  TripRoomState() {
    ///Initialize variables
  }

  RxBool gettingState = false.obs;
  RxString error = ''.obs;
  TripRoomModel? tripRoomModel;
}
