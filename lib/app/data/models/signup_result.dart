
class SignupResult {
  bool? status;
  String? token;
  User? user;

  SignupResult({this.status, this.token, this.user});

  SignupResult.fromJson(Map<String, dynamic> json) {
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
  String? uId;
  String? mobile;
  String? photo;
  String? location;
  String? fireToken;
  String? name;
  String? updatedAt;
  String? createdAt;
  int? id;

  User({this.uId, this.mobile, this.photo, this.location, this.fireToken, this.name, this.updatedAt, this.createdAt, this.id});

  User.fromJson(Map<String, dynamic> json) {
    if(json["u_id"] is String) {
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
    if(json["fire_token"] is String) {
      fireToken = json["fire_token"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["updated_at"] is String) {
      updatedAt = json["updated_at"];
    }
    if(json["created_at"] is String) {
      createdAt = json["created_at"];
    }
    if(json["id"] is int) {
      id = json["id"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["u_id"] = uId;
    _data["mobile"] = mobile;
    _data["photo"] = photo;
    _data["location"] = location;
    _data["fire_token"] = fireToken;
    _data["name"] = name;
    _data["updated_at"] = updatedAt;
    _data["created_at"] = createdAt;
    _data["id"] = id;
    return _data;
  }
}