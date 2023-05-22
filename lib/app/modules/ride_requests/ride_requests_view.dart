import 'package:carpooling_o6u_students/app/core/widgets/request_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import 'ride_requests_controller.dart';

class RideRequestsPage extends StatefulWidget {
  const RideRequestsPage({Key? key}) : super(key: key);

  @override
  State<RideRequestsPage> createState() => _RideRequestsPageState();
}

class _RideRequestsPageState extends State<RideRequestsPage> {
  final controller = Get.find<RideRequestsController>();
  final state = Get.find<RideRequestsController>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "All Requests",
          style: Get.textTheme.bodyLarge,
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
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
              if (controller.state.gettingState.value) {
                return Center(
                  child: SpinKitFadingCircle(
                    color: Get.theme.primaryColor,
                  ),
                );
              } else {
                if (controller.state.error.value.isNotEmpty) {
                  return Center(
                    child: Text(
                      "${controller.state.error.value}",
                      style: Get.textTheme.bodyLarge!.copyWith(
                        color: Colors.black,
                      ),
                    ),
                  );
                } else {
                  if (controller.state.requests!.requets!.isEmpty) {
                    return Center(
                      child: Text(
                        "No requests yet.",
                        style: Get.textTheme.bodyLarge!.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    );
                  } else {
                    return ListView.separated(
                      itemCount: controller.state.requests!.requets!.length,
                      itemBuilder: (context, index) {
                        return RequestCard(index: index);
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider(color: Colors.black);
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

  @override
  void dispose() {
    Get.delete<RideRequestsController>();
    super.dispose();
  }
}
