import 'dart:convert';

import 'package:carpooling_o6u_students/app/data/services/login_result.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:carpooling_o6u_students/app/data/models/signup_result.dart';

import '../../core/config/apis.dart';

class AuthServices {
  static Future<Either<String, SignupResult>> signUp({
    required String id,
    required String name,
    required String phone,
    required String lat_location,
    required String long_location,
    required String address,
    required String password,
    required String firebasetoken,
    required var photo,
  }) async {
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(signUpAPI),
      );
      request.fields.addAll(
        {
          'u_id':id,
          'mobile':phone,
          'lat_location':lat_location,
          'long_location':long_location,
          'address':address,
          'fire_token':firebasetoken,
          'name':name,
          'password':password,

        },
      );
      if (photo != null) {
        request.files.add(
          http.MultipartFile.fromBytes('photo', photo, filename: 'name.png'),
        );
      }else{
        return const Left("Photo requird");
      }

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // print(await response.stream.bytesToString());
        var result = await response.stream.bytesToString();
        var formatedResult = jsonDecode(result);
        print(formatedResult);
        if (jsonDecode(result)['token'] != null) {
          return Right(SignupResult.fromJson(formatedResult));
        } else {
          return Left(formatedResult['msg'].toString());
        }
      } else {
        // print(response.reasonPhrase);
        return Left(response.reasonPhrase!.toString());
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
  static Future<Either<String, LoginResult>> login({
    required String id,
  
   
    
    required String password,
    required String firebasetoken,
   
  }) async {
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(loginAPI),
      );
      request.fields.addAll(
        {
          'u_id':id,
         
          
          'firebse_token':firebasetoken,
        
          'password':password,

        },
      );
      

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // print(await response.stream.bytesToString());
        var result = await response.stream.bytesToString();
        var formatedResult = jsonDecode(result);
        print(formatedResult);
        if (jsonDecode(result)['token'] != null) {
          return Right(LoginResult.fromJson(formatedResult));
        } else {
          return Left(formatedResult['msg'].toString());
        }
      } else {
        // print(response.reasonPhrase);
        return Left(response.reasonPhrase!.toString());
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
  
}
