
class SignupError {
  bool? status;
  String? errNum;
  Msg? msg;

  SignupError({this.status, this.errNum, this.msg});

  SignupError.fromJson(Map<String, dynamic> json) {
    if(json["status"] is bool) {
      status = json["status"];
    }
    if(json["errNum"] is String) {
      errNum = json["errNum"];
    }
    if(json["msg"] is Map) {
      msg = json["msg"] == null ? null : Msg.fromJson(json["msg"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["errNum"] = errNum;
    if(msg != null) {
      _data["msg"] = msg?.toJson();
    }
    return _data;
  }
}

class Msg {
  List<String>? uId;
  List<String>? age;
  List<String>? mobile;
  List<String>? photo;
  List<String>? location;
  List<String>? fireToken;
  List<String>? name;
  List<String>? password;

  Msg({this.uId, this.age, this.mobile, this.photo, this.location, this.fireToken, this.name, this.password});

  Msg.fromJson(Map<String, dynamic> json) {
    if(json["u_id"] is List) {
      uId = json["u_id"] == null ? null : List<String>.from(json["u_id"]);
    }
    if(json["age"] is List) {
      age = json["age"] == null ? null : List<String>.from(json["age"]);
    }
    if(json["mobile"] is List) {
      mobile = json["mobile"] == null ? null : List<String>.from(json["mobile"]);
    }
    if(json["photo"] is List) {
      photo = json["photo"] == null ? null : List<String>.from(json["photo"]);
    }
    if(json["location"] is List) {
      location = json["location"] == null ? null : List<String>.from(json["location"]);
    }
    if(json["fire_token"] is List) {
      fireToken = json["fire_token"] == null ? null : List<String>.from(json["fire_token"]);
    }
    if(json["name"] is List) {
      name = json["name"] == null ? null : List<String>.from(json["name"]);
    }
    if(json["password"] is List) {
      password = json["password"] == null ? null : List<String>.from(json["password"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(uId != null) {
      _data["u_id"] = uId;
    }
    if(age != null) {
      _data["age"] = age;
    }
    if(mobile != null) {
      _data["mobile"] = mobile;
    }
    if(photo != null) {
      _data["photo"] = photo;
    }
    if(location != null) {
      _data["location"] = location;
    }
    if(fireToken != null) {
      _data["fire_token"] = fireToken;
    }
    if(name != null) {
      _data["name"] = name;
    }
    if(password != null) {
      _data["password"] = password;
    }
    return _data;
  }
}