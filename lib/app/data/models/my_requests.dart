
class MyRequests {
  bool? status;
  String? errNum;
  String? msg;
  List<Requets>? requets;

  MyRequests({this.status, this.errNum, this.msg, this.requets});

  MyRequests.fromJson(Map<String, dynamic> json) {
    if(json["status"] is bool) {
      status = json["status"];
    }
    if(json["errNum"] is String) {
      errNum = json["errNum"];
    }
    if(json["msg"] is String) {
      msg = json["msg"];
    }
    if(json["requets"] is List) {
      requets = json["requets"] == null ? null : (json["requets"] as List).map((e) => Requets.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["errNum"] = errNum;
    _data["msg"] = msg;
    if(requets != null) {
      _data["requets"] = requets?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Requets {
  int? id;
  int? driverId;
  String? carPhoto;
  int? seats;
  String? carType;
  String? carNum;
  String? startTime;
  String? endTime;
  String? startLocation;
  String? endLocation;
  String? state;
  String? createdAt;
  String? updatedAt;
  String? tripsState;

  Requets({this.id, this.driverId, this.carPhoto, this.seats, this.carType, this.carNum, this.startTime, this.endTime, this.startLocation, this.endLocation, this.state, this.createdAt, this.updatedAt, this.tripsState});

  Requets.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["driver_id"] is int) {
      driverId = json["driver_id"];
    }
    if(json["car_photo"] is String) {
      carPhoto = json["car_photo"];
    }
    if(json["seats"] is int) {
      seats = json["seats"];
    }
    if(json["car_type"] is String) {
      carType = json["car_type"];
    }
    if(json["car_num"] is String) {
      carNum = json["car_num"];
    }
    if(json["start_time"] is String) {
      startTime = json["start_time"];
    }
    if(json["end_time"] is String) {
      endTime = json["end_time"];
    }
    if(json["start_location"] is String) {
      startLocation = json["start_location"];
    }
    if(json["end_location"] is String) {
      endLocation = json["end_location"];
    }
    if(json["state"] is String) {
      state = json["state"];
    }
    if(json["created_at"] is String) {
      createdAt = json["created_at"];
    }
    if(json["updated_at"] is String) {
      updatedAt = json["updated_at"];
    }
    if(json["trips_state"] is String) {
      tripsState = json["trips_state"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["driver_id"] = driverId;
    _data["car_photo"] = carPhoto;
    _data["seats"] = seats;
    _data["car_type"] = carType;
    _data["car_num"] = carNum;
    _data["start_time"] = startTime;
    _data["end_time"] = endTime;
    _data["start_location"] = startLocation;
    _data["end_location"] = endLocation;
    _data["state"] = state;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    _data["trips_state"] = tripsState;
    return _data;
  }
}