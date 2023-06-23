import 'package:carpooling_o6u_students/app/data/models/TripRoomModel.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';

class TripRoomState {
  TripRoomState() {
    ///Initialize variables
  }

  RxBool gettingState = false.obs;
  RxString error = ''.obs;
  TripRoomModel? tripRoomModel;
  String? startAddress;
  String? endAddress;
  List<RateModel>rates=[];
}

class RateModel extends Equatable {
  String? id;
  int? rate;
  RateModel({required this.id,required this.rate});

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}

