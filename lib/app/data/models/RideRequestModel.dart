class RideRequestModel {
  RideRequestModel({
      this.status, 
      this.errNum, 
      this.msg, 
      this.requets,});

  RideRequestModel.fromJson(dynamic json) {
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
      this.uid2,});

  Requets.fromJson(dynamic json) {
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