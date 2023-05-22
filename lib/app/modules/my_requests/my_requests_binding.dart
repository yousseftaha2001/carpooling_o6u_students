import 'package:get/get.dart';

import 'my_requests_controller.dart';

class MyRequestsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyRequestsController>(
      () => MyRequestsController(),
    );
  }
}
