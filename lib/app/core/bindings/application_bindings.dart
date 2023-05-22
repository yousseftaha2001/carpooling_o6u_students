import 'package:carpooling_o6u_students/app/modules/signup/signup_controller.dart';
import 'package:get/get.dart';

class ApplicationBindings extends Bindings {
  @override
  void dependencies() {
  Get.lazyPut<SignupController>(
      () => SignupController(),
    );
  }
}
