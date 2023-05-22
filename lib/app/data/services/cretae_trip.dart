import 'dart:convert';

import 'package:carpooling_o6u_students/app/core/config/apis.dart';
import 'package:carpooling_o6u_students/app/core/helpers/local_data.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class CreateTripServices {
  static Future<Either<String, String>> createTrip({
    required String seats,
    required String carTypes,
    required String carNum,
    required String startTime,
    required String endTime,
    required String startLocation,
    required String endLocation,
    required var photo,
  }) async {
    try {
      var token = MyDataBase.getToken();
      print(token);
      var headers = {
        'Authorization':
            'Bearer $token'
      };
      print(createTripAPI);
      var request = http.MultipartRequest('POST', Uri.parse(createTripAPI));
      request.fields.addAll({
        'seates': seats,
        'car_type': carTypes,
        'car_num': carNum,
        'start_time': startTime,
        'end_time': endTime,
        'start_location': startLocation,
        'end_location': endLocation,
      });
      if (photo != null) {
        request.files.add(
          http.MultipartFile.fromBytes('car_photo', photo, filename: 'name.png'),
        );
      } else {
        return const Left("Photo requird");
      }
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // print(await response.stream.bytesToString());
        var result = await response.stream.bytesToString();
        var formatedResult = jsonDecode(result);
        print(formatedResult);
        if (jsonDecode(result)['msg'] == 'Done your trip has been created') {
          return Right("Done");
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
