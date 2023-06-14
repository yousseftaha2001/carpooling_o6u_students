import 'dart:io';

import 'package:carpooling_o6u_students/app/core/helpers/local_data.dart';
import 'package:carpooling_o6u_students/app/core/widgets/circular_dialog.dart';
import 'package:carpooling_o6u_students/app/data/services/auth_services.dart';
import 'package:carpooling_o6u_students/app/modules/home/home_page.dart';
import 'package:carpooling_o6u_students/app/modules/my_map/my_map_page.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SignupController extends GetxController {
  //TODO: Implement SignupController.

  File? studentImage;
  late TextEditingController id;
  late TextEditingController name;
  late TextEditingController phone;
  late TextEditingController password;
  late LatLng studentLocation;
  late String firebaseToken;

  Future<void> pickerImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: false,
      allowedExtensions: ['jpg', 'pdf', 'doc'],
    );
    if (result != null) {
      print(result.paths);
      studentImage = File(result.files.first.path!);
      update(["image", "button"]);
    } else {}
  }

  bool buttonState() =>
      studentImage != null &&
      name.text.isNotEmpty &&
      id.text.isNotEmpty &&
      phone.text.isNotEmpty &&
      password.text.isNotEmpty;

  void updateButton() {
    update(['button']);
  }

  void continueButton() {
    Get.to(() => MyMapPage(
          destination: "signUp",
        ));
  }

  void getFirebaseToken() async {
    try {
      var result = await FirebaseMessaging.instance.getToken();
      if (result!.isNotEmpty) {
        printInfo(info: "token is $result");
        firebaseToken = result;
      } else {
        print("object1");
        firebaseToken = 'error';
      }
    } catch (e) {
      print("${e.toString()}");
      firebaseToken = 'error';
    }
  }

  void startSignup() async {
    Get.back();
    if (firebaseToken.isNotEmpty && firebaseToken != 'error') {
      Get.dialog(CircularDialog(), barrierDismissible: false);
      String add =
          await getAddress(studentLocation.latitude, studentLocation.longitude);
      var result = await AuthServices.signUp(
        id: id.text,
        name: name.text,
        phone: phone.text,
        lat_location: studentLocation.latitude.toString(),
        long_location: studentLocation.longitude.toString(),
        address: add,
        firebasetoken: firebaseToken,
        password: password.text,
        photo: studentImage!.readAsBytesSync(),
      );
      result.fold(
        (l) {
          Get.back();
          Get.dialog(
            InfoDialog(
              title: Icons.error_outline_outlined,
              error: l.toString(),
            ),
          );
        },
        (r) async {
          print("welcome");
          await MyDataBase.insertData(
              token: r.token!, studnetId: r.user!.uId!, photo: r.user!.photo!);

          Get.back();
          Get.offAll(
            () => HomePage(),
          );
          // print(r);
        },
      );
    }
  }

  Future<String> getAddress(double latitude, double longitude) async {
    final List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);

    if (placemarks != null && placemarks.isNotEmpty) {
      final Placemark placemark = placemarks[0];
      final String address =
          '${placemark.name},${placemark.administrativeArea},${placemark.subAdministrativeArea}';

      return address;
    } else {
      return "No address found";
    }
  }

  @override
  void onInit() {
    super.onInit();
    getFirebaseToken();
    id = TextEditingController();
    name = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
  }
}
