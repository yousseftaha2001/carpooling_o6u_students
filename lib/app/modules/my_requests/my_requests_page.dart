import 'package:carpooling_o6u_students/app/modules/my_requests/widgets/my_request_wid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import 'my_requests_controller.dart';

class MyRequestsPage extends GetView<MyRequestsController> {
   MyRequestsPage({super.key});
   MyRequestsController controller=Get.put(MyRequestsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "My Requests",
          style: Get.textTheme.bodyMedium,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Obx(
            () {
              if (controller.gettingState.value) {
                return Center(
                  child: SpinKitFadingCircle(
                    color: Get.theme.primaryColor,
                  ),
                );
              } else {
                if (controller.error.value.isNotEmpty) {
                  return Center(
                    child: Text("Some thing want wrong please try again"),
                  );
                } else {
                  if (controller.requests == null) {
                    return Center(
                      child: Text("Some thing want wrong please try again"),
                    );
                  } else {
                    return ListView.separated(
                      itemCount: controller.requests!.requets!.length,
                      itemBuilder: (context, index) {
                        return MyRequestWidget(
                          index: index,
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Divider(
                          color: Colors.black,
                        );
                      },
                    );
                  }
                }
              }
            },
          ),
        ),
      ),
    );
  }
}
