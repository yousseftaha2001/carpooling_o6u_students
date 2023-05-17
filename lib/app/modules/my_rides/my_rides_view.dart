import 'package:carpooling_o6u_students/app/core/widgets/my_rides.dart';
import 'package:carpooling_o6u_students/app/core/widgets/trip_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import 'my_rides_controller.dart';

class MyRidesPage extends StatefulWidget {
  const MyRidesPage({Key? key}) : super(key: key);

  @override
  State<MyRidesPage> createState() => _MyRidesPageState();
}

class _MyRidesPageState extends State<MyRidesPage> {
  final controller = Get.put(MyRidesController());
  final state = Get.find<MyRidesController>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "My Rides",
          style: Get.textTheme.bodyMedium,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
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
                    child: Text("Some thing want wrong please try again"),
                  );
                } else {
                  if (controller.state.tripsModel == null) {
                    return Center(
                      child: Text("Some thing want wrong please try again"),
                    );
                  } else {
                    return ListView.separated(
                      itemCount: controller.state.tripsModel!.trips!.length,
                      itemBuilder: (context, index) {
                        return MyRideCard(index: index);
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

  @override
  void dispose() {
    Get.delete<MyRidesController>();
    super.dispose();
  }
}