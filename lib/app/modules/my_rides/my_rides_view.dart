import 'package:carpooling_o6u_students/app/core/widgets/my_rides.dart';
import 'package:carpooling_o6u_students/app/core/widgets/trip_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../home/widgets/leading_button.dart';
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
        leading: LeadingButton(),
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
                    child: Text("${controller.state.error.value}"),
                  );
                } else {
                  if (controller.state.tripsModel == null) {
                    return const Center(
                      child: Text("Some thing want wrong please try again"),
                    );
                  } else {
                    return Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Obx(
                            () {
                              return Row(
                                children: [
                                  Flexible(
                                    child: CheckboxListTile(
                                      value: controller.state.allTrips.value
                                          ? true
                                          : false,
                                      onChanged: (value) {
                                        controller.state.allTrips.value = true;
                                      },
                                      title: Text(
                                        "All",
                                        style: Get.textTheme.bodySmall,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: CheckboxListTile(
                                      value: !controller.state.allTrips.value
                                          ? true
                                          : false,
                                      onChanged: (value) {
                                        controller.state.allTrips.value = false;
                                      },
                                      title: Text(
                                        "Wait",
                                        style: Get.textTheme.bodySmall,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        Expanded(
                          flex: 20,
                          child: ListView.separated(
                            itemCount:
                                controller.state.tripsModel!.trips!.length,
                            itemBuilder: (context, index) {
                              return Obx(
                                () => controller.state.allTrips.value
                                    ? RideCard(index: index)
                                    : controller.state.tripsModel!.trips![index]
                                                .state ==
                                            'waiting'
                                        ? RideCard(index: index)
                                        : Container(),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return Obx(
                                () => controller.state.allTrips.value
                                    ? Divider(color: Colors.black)
                                    : controller.state.tripsModel!.trips![index]
                                                .state ==
                                            'waiting'
                                        ? Divider(color: Colors.black)
                                        : Container(),
                              );
                            },
                          ),
                        ),
                      ],
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
