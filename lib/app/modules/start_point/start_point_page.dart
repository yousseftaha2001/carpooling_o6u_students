import 'package:carpooling_o6u_students/app/modules/home/home_page.dart';
import 'package:carpooling_o6u_students/app/modules/signup/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../login_page/login_page_page.dart';
import 'start_point_controller.dart';

class StartPointPage extends GetView<StartPointController> {
   StartPointPage({super.key});
   StartPointController logic=Get.put(StartPointController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (logic.token.isNotEmpty) {
      return  HomePage();
      } else {
        return LoginPagePage();
      }
    });
  }
}
