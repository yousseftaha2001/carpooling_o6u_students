import 'package:carpooling_o6u_students/app/core/helpers/local_data.dart';
import 'package:carpooling_o6u_students/app/modules/login_page/login_page_page.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController.

  void logout()async{
    MyDataBase.removeDate();
    Get.offAll(()=>LoginPagePage());
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
