class MyRequests {
  MyRequests({
      this.status, 
      this.errNum, 
      this.msg, 
      this.requets,});

  MyRequests.fromJson(dynamic json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    if (json['requets'] != null) {
      requets = [];
      json['requets'].forEach((v) {
        requets?.add(Requets.fromJson(v));
      });
    }
  }
  bool? status;
  String? errNum;
  String? msg;
  List<Requets>? requets;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['errNum'] = errNum;
    map['msg'] = msg;
    if (requets != null) {
      map['requets'] = requets?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Requets {
  Requets({
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
      this.tripsState, 
      this.tripsId, 
      this.takeen, 
      this.ridePoint,});

  Requets.fromJson(dynamic json) {
    id = json['id'];
    driverId = json['driver_id'];
    carPhoto = json['car_photo'];
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
    tripsState = json['trips_state'];
    tripsId = json['trips_id'];
    takeen = json['takeen'];
    ridePoint = json['ride_point'];
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
  String? tripsState;
  num? tripsId;
  num? takeen;
  dynamic ridePoint;

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
    map['trips_state'] = tripsState;
    map['trips_id'] = tripsId;
    map['takeen'] = takeen;
    map['ride_point'] = ridePoint;
    return map;
  }

}