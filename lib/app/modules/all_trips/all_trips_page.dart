import 'package:carpooling_o6u_students/app/core/widgets/trip_widget.dart';
import 'package:carpooling_o6u_students/app/modules/all_trips/widgets/trip_widget.dart';
import 'package:carpooling_o6u_students/app/modules/home/widgets/leading_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'all_trips_controller.dart';

class AllTripsPage extends StatefulWidget {
  AllTripsPage({super.key});

  @override
  State<AllTripsPage> createState() => _AllTripsPageState();
}

class _AllTripsPageState extends State<AllTripsPage> {
  AllTripsController controller = Get.put(AllTripsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "All Trips",
          style: Get.textTheme.bodyMedium,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: LeadingButton(),
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
                    child: Text(
                      "Some thing want wrong please try again",
                      style: Get.textTheme.bodySmall!.copyWith(
                        color: Colors.black,
                      ),
                    ),
                  );
                } else {
                  if (controller.tripsModel == null) {
                    return Center(
                      child: Text(
                        "Some thing want wrong please try again",
                        style: Get.textTheme.bodySmall!.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    );
                  } else {
                    if (controller.tripsModel!.trips!.isNotEmpty) {
                      return ListView.separated(
                        itemCount: controller.tripsModel!.trips!.length,
                        itemBuilder: (context, index) {
                          return TripAds(index: index);
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider(
                            color: Colors.black,
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: Text(
                          "No trips Yet",
                          style: Get.textTheme.bodySmall!.copyWith(
                            color: Colors.black,
                          ),
                        ),
                      );
                    }
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
    Get.delete<AllTripsController>();
    super.dispose();
  }
}
