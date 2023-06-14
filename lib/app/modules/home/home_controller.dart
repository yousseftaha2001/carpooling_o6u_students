import 'package:carpooling_o6u_students/app/core/helpers/local_data.dart';
import 'package:carpooling_o6u_students/app/modules/all_trips/all_trips_page.dart';
import 'package:carpooling_o6u_students/app/modules/create_trip/create_trip_page.dart';
import 'package:carpooling_o6u_students/app/modules/login_page/login_page_page.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../my_requests/my_requests_page.dart';
import '../my_rides/my_rides_view.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController.

  RxInt cureentScreen = 1.obs;
  List<Widget> screens = [
    CreateTripPage(),
    AllTripsPage(),
    MyRequestsPage(),
    MyRidesPage()
  ];

  double xOffset = 0;
  double yOffset = 0;
  bool isDrawerOpen = false;

  void closeDrawer() {
    xOffset = 0;
    yOffset = 0;
    isDrawerOpen = false;
    update();
  }

  void openDrawer() {
    xOffset = Get.width/1.6;
    yOffset = Get.height/12;
    isDrawerOpen = true;
    update();
  }

  void logout() async {
    MyDataBase.removeDate();
    Get.offAll(() => LoginPagePage());
  }

  void getFirebaseToken() async {
    try {
      var result = await FirebaseMessaging.instance.getToken();
      if (result!.isNotEmpty) {
        printInfo(info: "token is $result");
        // firebaseToken = result;
      } else {
        print("object1");
        // firebaseToken = 'error';
      }
    } catch (e) {
      print("${e.toString()}");
      // firebaseToken = 'error';
    }
  }

  @override
  void onInit() {
    super.onInit();
    getFirebaseToken();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
