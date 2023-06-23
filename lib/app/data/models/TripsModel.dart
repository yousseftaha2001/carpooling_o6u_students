import 'package:carpooling_o6u_students/app/core/config/apis.dart';

class TripsModel {
  TripsModel({
      this.status, 
      this.errNum, 
      this.msg, 
      this.trips,});

  TripsModel.fromJson(dynamic json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    if (json['trips'] != null) {
      trips = [];
      json['trips'].forEach((v) {
        trips?.add(Trips.fromJson(v));
      });
    }
  }
  bool? status;
  String? errNum;
  String? msg;
  List<Trips>? trips;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['errNum'] = errNum;
    map['msg'] = msg;
    if (trips != null) {
      map['trips'] = trips?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Trips {
  Trips({
      this.id, 
      this.driverId, 
      this.carPhoto, 
      this.seats, 
      this.carType, 
      this.carNum, 
      this.startTime, 
      this.endTime, 
      this.startLocation, 
      this.endLocation, 
      this.state, 
      this.currentLocation, 
      this.createdAt, 
      this.updatedAt, 
      this.driverName, 
      this.driverUId, 
      this.driverRate, 
      this.raters, 
      this.driverPhoto,});

  Trips.fromJson(dynamic json) {
    id = json['id'];
    driverId = json['driver_id'];
    carPhoto = '$photoAPI${json['car_photo']}';
    seats = json['seats'];
    carType = json['car_type'];
    carNum = json['car_num'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    startLocation = json['start_location'];
    endLocation = json['end_location'];
    state = json['state'];
    currentLocation = json['current_location'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    driverName = json['driver_name'];
    driverUId = json['driver_u_id'];
    driverRate = json['driver_rate'];
    raters = json['raters'];
    driverPhoto = '$photoAPI${json['driver_photo']}';
  }
  num? id;
  num? driverId;
  String? carPhoto;
  num? seats;
  String? carType;
  String? carNum;
  String? startTime;
  String? endTime;
  String? startLocation;
  String? endLocation;
  String? state;
  dynamic currentLocation;
  String? createdAt;
  String? updatedAt;
  String? driverName;
  num? driverUId;
  num? driverRate;
  num? raters;
  String? driverPhoto;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['driver_id'] = driverId;
    map['car_photo'] = carPhoto;
    map['seats'] = seats;
    map['car_type'] = carType;
    map['car_num'] = carNum;
    map['start_time'] = startTime;
    map['end_time'] = endTime;
    map['start_location'] = startLocation;
    map['end_location'] = endLocation;
    map['state'] = state;
    map['current_location'] = currentLocation;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['driver_name'] = driverName;
    map['driver_u_id'] = driverUId;
    map['driver_rate'] = driverRate;
    map['raters'] = raters;
    map['driver_photo'] = driverPhoto;
    return map;
  }

}