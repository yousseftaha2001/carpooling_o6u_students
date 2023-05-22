import 'dart:convert';

import 'package:carpooling_o6u_students/app/core/config/apis.dart';
import 'package:carpooling_o6u_students/app/core/helpers/local_data.dart';
import 'package:carpooling_o6u_students/app/data/models/RideRequestModel.dart';
import 'package:carpooling_o6u_students/app/data/models/TripRoomModel.dart';
import 'package:carpooling_o6u_students/app/data/models/my_requests.dart';
import 'package:carpooling_o6u_students/app/data/models/trips_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class AllTripsServices {
  static Future<Either<String, TripsModel>> getAllTrips() async {
    try {
      var token = MyDataBase.getToken();
      var headers = {'Authorization': 'Bearer $token'};
      var request = http.Request('GET', Uri.parse(allTripsAPI));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // print(await response.stream.bytesToString());
        var result = await response.stream.bytesToString();
        var formatedResult = jsonDecode(result);
        print(formatedResult);
        if (jsonDecode(result)['msg'] == "Success") {
          return Right(TripsModel.fromJson(formatedResult));
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

  static Future<Either<String, TripsModel>> myTrips() async {
    try {
      var token = MyDataBase.getToken();
      var headers = {'Authorization': 'Bearer $token'};
      var request = http.Request('GET', Uri.parse(myTripsAPI));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // print(await response.stream.bytesToString());
        var result = await response.stream.bytesToString();
        var formatedResult = jsonDecode(result);
        print(formatedResult);
        if (jsonDecode(result)['msg'] == "Success") {
          return Right(TripsModel.fromJson(formatedResult));
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

  static Future<Either<String, MyRequests>> getMyRequests() async {
    try {
      var token = MyDataBase.getToken();
      var id = MyDataBase.getStudnetId();
      var headers = {'Authorization': 'Bearer $token'};
      print('$allTripsAPI$id');
      var request = http.Request('GET', Uri.parse('$myRequestsAPI$id'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // print(await response.stream.bytesToString());
        var result = await response.stream.bytesToString();
        var formatedResult = jsonDecode(result);
        print(formatedResult);
        if (jsonDecode(result)['msg'] == "Success") {
          return Right(MyRequests.fromJson(formatedResult));
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

  static Future<Either<String, String>> sendRequest(
      {required String tripId}) async {
    try {
      var token = MyDataBase.getToken();
      print(token);
      var headers = {'Authorization': 'Bearer $token'};
      print(createTripAPI);
      var request = http.MultipartRequest('POST', Uri.parse(sendRequestAPI));
      request.fields.addAll({
        'u_id': MyDataBase.getStudnetId(),
        'trip_id': tripId,
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // print(await response.stream.bytesToString  ());
        var result = await response.stream.bytesToString();
        var formatedResult = jsonDecode(result);
        print(formatedResult);
        if (jsonDecode(result)['msg'] == 'Done') {
          return Right("Done");
        } else {
          return Left(formatedResult['msg'].toString());
        }
      } else {
        print(response.reasonPhrase);
        return Left(response.reasonPhrase!.toString());
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  static Future<Either<String, String>> startRide(
      {required String tripId}) async {
    try {
      var token = MyDataBase.getToken();

      var headers = {'Authorization': 'Bearer $token'};

      var request = http.MultipartRequest('PUT', Uri.parse('$startTripAPI$tripId'));


      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // print(await response.stream.bytesToString  ());
        var result = await response.stream.bytesToString();
        var formatedResult = jsonDecode(result);
        print(formatedResult);
        if (jsonDecode(result)['msg'] == 'trip has been started') {
          return Right("Done");
        } else {
          return Left(formatedResult['msg'].toString());
        }
      } else {
        print(response.reasonPhrase);
        return Left(response.reasonPhrase!.toString());
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
  static Future<Either<String, String>> endRide(
      {required String tripId}) async {
    try {
      var token = MyDataBase.getToken();

      var headers = {'Authorization': 'Bearer $token'};

      var request = http.MultipartRequest('PUT', Uri.parse('$endTripAPI$tripId'));


      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // print(await response.stream.bytesToString  ());
        var result = await response.stream.bytesToString();
        var formatedResult = jsonDecode(result);
        // print(formatedResult);
        if (jsonDecode(result)['msg'] == 'DONE') {
          return Right("Done");
        } else {
          return Left(formatedResult['msg'].toString());
        }
      } else {
        print(response.reasonPhrase);
        return Left(response.reasonPhrase!.toString());
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
  static Future<Either<String, String>> rideTrip(
      {required String tripId}) async {
    try {
      print(tripId+'ds');
      var token = MyDataBase.getToken();

      var headers = {'Authorization': 'Bearer $token'};

      var request = http.MultipartRequest('PUT', Uri.parse('$rideTripAPI$tripId'));


      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // print(await response.stream.bytesToString  ());
        var result = await response.stream.bytesToString();
        var formatedResult = jsonDecode(result);
        // print(formatedResult);
        if (jsonDecode(result)['msg'] == 'You are in!!!') {
          return Right(jsonDecode(result)['msg']);
        } else {
          return Left(formatedResult['msg'].toString());
        }
      } else {
        print(response.reasonPhrase);
        return Left(response.reasonPhrase!.toString());
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  static Future<Either<String, RideRequestModel>> getRideRequests(
      {required String tripId}) async {
    try {
      var token = MyDataBase.getToken();
      print(token);
      var headers = {'Authorization': 'Bearer $token'};
      print(createTripAPI);
      var request =
          http.MultipartRequest('GET', Uri.parse('$rideRequestsAPI$tripId'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // print(await response.stream.bytesToString());
        var result = await response.stream.bytesToString();
        var formatedResult = jsonDecode(result);
        print(formatedResult);
        print(formatedResult);
        if (formatedResult['msg'] == 'Success') {
          return Right(RideRequestModel.fromJson(formatedResult));
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

  static Future<Either<String, TripRoomModel>> getTripRoom(
      {required String tripId}) async {
    try {
      var token = MyDataBase.getToken();
      print(token);
      var headers = {'Authorization': 'Bearer $token'};
      print(createTripAPI);
      var request =
          http.MultipartRequest('GET', Uri.parse('$tripRoomAPI$tripId'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // print(await response.stream.bytesToString());
        var result = await response.stream.bytesToString();
        var formatedResult = jsonDecode(result);

        if (formatedResult['msg'] == 'DONE') {
          return Right(TripRoomModel.fromJson(formatedResult));
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

  static Future<Either<String, String>> changeRequestState({
    required String tripId,
    required String uid,
    required String requestId,
    required String state,
  }) async {
    try {
      print(tripId);
      print(uid);
      print(requestId);
      print(state);
      var token = MyDataBase.getToken();
      print(token);
      var headers = {'Authorization': 'Bearer $token'};
      print(createTripAPI);
      var request =
          http.MultipartRequest('POST', Uri.parse(changeRequestStateAPI));
      request.fields.addAll({
        'request_id': requestId,
        'new_state': state,
        'u_id': uid,
        'trip_id': tripId,
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // print(await response.stream.bytesToString());
        var result = await response.stream.bytesToString();
        var formatedResult = jsonDecode(result);
        print(formatedResult);
        if (jsonDecode(result)['status']) {
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
