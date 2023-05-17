import 'package:carpooling_o6u_students/app/data/models/RideRequestModel.dart';
import 'package:get/get.dart';

class RideRequestsState {
  RideRequestsState() {
    ///Initialize variables
  }


  RxBool gettingState = false.obs;
  RxString error = ''.obs;
  RideRequestModel? requests;

}
