import 'package:carpooling_o6u_students/app/core/helpers/local_data.dart';
import 'package:carpooling_o6u_students/app/core/widgets/circular_dialog.dart';
import 'package:carpooling_o6u_students/app/data/services/auth_services.dart';
import 'package:carpooling_o6u_students/app/modules/home/home_page.dart';
import 'package:carpooling_o6u_students/app/modules/notification_api.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('Handling a background message ${message.messageId}');
  NotificationApi().showNotification(body: message.notification!.body!);
}

class LoginPageController extends GetxController {
  //TODO: Implement LoginPageController.
  late TextEditingController id;
  late TextEditingController password;
  late String firebaseToken;

  bool buttonState() => id.text.isNotEmpty && password.text.isNotEmpty;

  void updateButton() {
    update(['button']);
  }

  void continueButton() {
    // Get.to(
    //   () => MyMapPage(
    //     destination: "signUp",
    //   ),
    // );
  }
  void login() async {
    if (firebaseToken.isNotEmpty && firebaseToken != 'error') {
      Get.dialog(CircularDialog(), barrierDismissible: false);
      var result = await AuthServices.login(
        id: id.text,
        firebasetoken: firebaseToken,
        password: password.text,
      );
      result.fold(
        (l) {
          Get.back();
          print("$l");
          Get.dialog(
            InfoDialog(
              error: l,
              title: Icons.error_outline_outlined,
            ),
          );
        },
        (r) async {
          print("welcome");
          await MyDataBase.insertData(
              token: r.token!, studnetId: r.user!.uId!.toString());

          Get.back();
          Get.offAll(
            () => HomePage(),
          );
          // print(r);
        },
      );
    }
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

  @override
  void onInit() {
    // notificationInit();
    // initMessage();

    getFirebaseToken();
    id = TextEditingController();
    password = TextEditingController();
  }

  void send() async {}

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
