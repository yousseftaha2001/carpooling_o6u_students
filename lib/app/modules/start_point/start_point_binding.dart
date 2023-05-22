import 'package:get/get.dart';

import 'start_point_controller.dart';

class StartPointBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StartPointController>(
      () => StartPointController(),
    );
  }
}
