import 'package:carpooling_o6u_students/app/modules/my_map/models/AutoCompleteRe.dart';
import 'package:carpooling_o6u_students/app/modules/my_map/models/GetLocationModel.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class MapServices {
  final String key = "AIzaSyBeBZvw0OrddEetTPbqVu4fyOXNYC5aT-U";


  Future<Either<String,GetLocationModel>>getLocation({required String placeId})async{
    var request = http.Request('GET', Uri.parse('https://maps.googleapis.com/maps/api/place/details/json?key=AIzaSyBeBZvw0OrddEetTPbqVu4fyOXNYC5aT-U&place_id=$placeId'));


    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var result=await response.stream.bytesToString();
      // print(convert.jsonDecode(result)['geometry']['location']);
      var result1=GetLocationModel.fromJson(convert.jsonDecode(result));
      return Right(result1);
    }
    else {
      print(response.reasonPhrase);
      return Left(response.reasonPhrase.toString());
    }

  }

  Future<Either<String,AutoCompleteRe>> searchAboutLocation({required String title}) async {
    var request = http.Request('GET', Uri.parse('https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$title&inputtype=textquery&key=AIzaSyBeBZvw0OrddEetTPbqVu4fyOXNYC5aT-U'));


    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());

      // Autocompletep
      var result=await response.stream.bytesToString();
      AutoCompleteRe autoCompleteRe=AutoCompleteRe.fromJson(convert.jsonDecode(result));
      // print(autoCompleteRe.predictions!.first.description);
      // getLocation(placeId: autoCompleteRe.predictions!.first.placeId!);
      return Right(autoCompleteRe);

    }
    else {
      // print(response.reasonPhrase);
      return Left(response.reasonPhrase.toString());
    }

    // print(json['candidates'][0]['place_id']);
  }

  Future<void> place({required String query,Map<String,String>? h}) async {
    Uri uri = Uri.https(
      "maps.googleapis.com",
      'maps/api/place/autocomplete/json',
      {
        'input':query,
        "key":'AIzaSyBeBZvw0OrddEetTPbqVu4fyOXNYC5aT-U'
      }
    );
    final res=await http.get(uri,headers: h);
    if(res.statusCode==200){
      print(convert.jsonDecode(res.body));
    }
  }
}
