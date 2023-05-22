
class LoginResult {
  bool? status;
  String? token;
  User? user;

  LoginResult({this.status, this.token, this.user});

  LoginResult.fromJson(Map<String, dynamic> json) {
    if(json["status"] is bool) {
      status = json["status"];
    }
    if(json["token"] is String) {
      token = json["token"];
    }
    if(json["user"] is Map) {
      user = json["user"] == null ? null : User.fromJson(json["user"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["token"] = token;
    if(user != null) {
      _data["user"] = user?.toJson();
    }
    return _data;
  }
}

class User {
  num? id;
  num? uId;
  String? mobile;
  String? photo;
  String? location;
  num? rateD;
  num? rateP;
  num? ratersD;
  num? ratersU;
  String? fireToken;
  String? name;
  dynamic email;
  dynamic emailVerifiedAt;
  String? createdAt;
  String? updatedAt;

  User({this.id, this.uId, this.mobile, this.photo, this.location, this.rateD, this.rateP, this.ratersD, this.ratersU, this.fireToken, this.name, this.email, this.emailVerifiedAt, this.createdAt, this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["u_id"] is int) {
      uId = json["u_id"];
    }
    if(json["mobile"] is String) {
      mobile = json["mobile"];
    }
    if(json["photo"] is String) {
      photo = json["photo"];
    }
    if(json["location"] is String) {
      location = json["location"];
    }
    if(json["rate_d"] is int) {
      rateD = json["rate_d"];
    }
    if(json["rate_p"] is int) {
      rateP = json["rate_p"];
    }
    if(json["raters_d"] is int) {
      ratersD = json["raters_d"];
    }
    if(json["raters_u"] is int) {
      ratersU = json["raters_u"];
    }
    if(json["fire_token"] is String) {
      fireToken = json["fire_token"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    email = json["email"];
    emailVerifiedAt = json["email_verified_at"];
    if(json["created_at"] is String) {
      createdAt = json["created_at"];
    }
    if(json["updated_at"] is String) {
      updatedAt = json["updated_at"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["u_id"] = uId;
    _data["mobile"] = mobile;
    _data["photo"] = photo;
    _data["location"] = location;
    _data["rate_d"] = rateD;
    _data["rate_p"] = rateP;
    _data["raters_d"] = ratersD;
    _data["raters_u"] = ratersU;
    _data["fire_token"] = fireToken;
    _data["name"] = name;
    _data["email"] = email;
    _data["email_verified_at"] = emailVerifiedAt;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    return _data;
  }
}