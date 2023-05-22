import 'package:http/http.dart'as http;
import 'dart:convert' as convert;
class MapServices {
  final String key = "AIzaSyAVpPRSF_fZsTF-ElyJZAXmtY9d1Ls-j70";
  Future<String> searchAboutLocation({required String title}) async {
    final utl =
        "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input='$title&inputtype=textquery&key=$key";
    var response=await http.get(Uri.parse(utl)); 
    print(response.body);
    var json=convert.jsonDecode(response.body);
    var place=json['candidates'][0]['place_id']as String;
    print(place);
    return place;
    // print(json['candidates'][0]['place_id']);
  }
}
