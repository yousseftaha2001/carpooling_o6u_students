class TripRoomModel {
  TripRoomModel({
    this.status,
    this.errNum,
    this.msg,
    this.passengers,
    this.trip,
  });

  TripRoomModel.fromJson(dynamic json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    if (json['passengers'] != null) {
      passengers = [];
      json['passengers'].forEach((v) {
        passengers?.add(Passengers.fromJson(v));
      });
    }
    trip = json['trip'] != null ? Trip.fromJson(json['trip']) : null;
  }

  bool? status;
  String? errNum;
  String? msg;
  List<Passengers>? passengers;
  Trip? trip;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['errNum'] = errNum;
    map['msg'] = msg;
    if (passengers != null) {
      map['passengers'] = passengers?.map((v) => v.toJson()).toList();
    }
    if (trip != null) {
      map['trip'] = trip?.toJson();
    }
    return map;
  }
}

class Trip {
  Trip({
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
    this.createdAt,
    this.updatedAt,
  });

  Trip.fromJson(dynamic json) {
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
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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
  String? createdAt;
  String? updatedAt;

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
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}

class Passengers {
  Passengers({
    this.id,
    this.uId,
    this.mobile,
    this.photo,
    this.latLocation,
    this.longLocation,
    this.address,
    this.rateD,
    this.rateP,
    this.ratersD,
    this.ratersU,
    this.fireToken,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.password,
    this.rememberToken,
    this.createdAt,
    this.updatedAt,
    this.requestState,
    this.tripId,
    this.uid2,
  });

  Passengers.fromJson(dynamic json) {
    id = json['id'];
    uId = json['u_id'];
    mobile = json['mobile'];
    photo = json['photo'];
    latLocation = json['lat_location'];
    longLocation = json['long_location'];
    address = json['address'];
    rateD = json['rate_d'];
    rateP = json['rate_p'];
    ratersD = json['raters_d'];
    ratersU = json['raters_u'];
    fireToken = json['fire_token'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    password = json['password'];
    rememberToken = json['remember_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    requestState = json['request_state'];
    tripId = json['trip_id'];
    uid2 = json['uid2'];
  }

  num? id;
  num? uId;
  String? mobile;
  String? photo;
  String? latLocation;
  String? longLocation;
  String? address;
  num? rateD;
  num? rateP;
  num? ratersD;
  num? ratersU;
  String? fireToken;
  String? name;
  dynamic email;
  dynamic emailVerifiedAt;
  String? password;
  dynamic rememberToken;
  String? createdAt;
  String? updatedAt;
  String? requestState;
  num? tripId;
  num? uid2;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['u_id'] = uId;
    map['mobile'] = mobile;
    map['photo'] = photo;
    map['lat_location'] = latLocation;
    map['long_location'] = longLocation;
    map['address'] = address;
    map['rate_d'] = rateD;
    map['rate_p'] = rateP;
    map['raters_d'] = ratersD;
    map['raters_u'] = ratersU;
    map['fire_token'] = fireToken;
    map['name'] = name;
    map['email'] = email;
    map['email_verified_at'] = emailVerifiedAt;
    map['password'] = password;
    map['remember_token'] = rememberToken;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['request_state'] = requestState;
    map['trip_id'] = tripId;
    map['uid2'] = uid2;
    return map;
  }
}
