
class SignupResposeErrro {
  bool? status;
  String? errNum;
  String? msg;

  SignupResposeErrro({this.status, this.errNum, this.msg});

  SignupResposeErrro.fromJson(Map<String, dynamic> json) {
    if(json["status"] is bool) {
      status = json["status"];
    }
    if(json["errNum"] is String) {
      errNum = json["errNum"];
    }
    if(json["msg"] is String) {
      msg = json["msg"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["errNum"] = errNum;
    _data["msg"] = msg;
    return _data;
  }
}