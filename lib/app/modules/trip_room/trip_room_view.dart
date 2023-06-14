import 'package:carpooling_o6u_students/app/core/widgets/passengers_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import 'trip_room_controller.dart';

class TripRoomPage extends StatefulWidget {
  const TripRoomPage({Key? key}) : super(key: key);

  @override
  State<TripRoomPage> createState() => _TripRoomPageState();
}

class _TripRoomPageState extends State<TripRoomPage> {
  final controller = Get.find<TripRoomController>();
  final state = Get.find<TripRoomController>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
                    child: Text("${controller.state.error.value}"),
                  );
                } else {
                  if (controller.state.tripRoomModel == null) {
                    return const Center(
                      child: Text("Some thing want wrong please try again"),
                    );
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: Get.width,
                          // height: 20.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.sp),
                            color: Color(0xffEEF1FF),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 10.h,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.location_on_outlined),
                                    SizedBox(width: 10.w),
                                    SizedBox(
                                      width: Get.width/1.9,
                                      child: Text(
                                        state.startAddress!,
                                        style: Get.textTheme.bodySmall!.copyWith(
                                          fontSize: 22.sp,
                                          fontWeight: FontWeight.normal,

                                        ),
                                        softWrap: true,
                                        overflow: TextOverflow.fade,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 50.h,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "state:  ",
                                        style:
                                            Get.textTheme.bodySmall!.copyWith(
                                          fontSize: 20.sp,
                                        ),
                                      ),
                                      Text(
                                        controller.state.tripRoomModel!.trip!
                                                    .state ==
                                                'end'
                                            ? "Done"
                                            : controller.state.tripRoomModel!
                                                        .trip!.state ==
                                                    'start'
                                                ? 'On track'
                                                : 'waiting',
                                        style:
                                            Get.textTheme.bodySmall!.copyWith(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.normal,
                                          color: controller.state.tripRoomModel!
                                                      .trip!.state ==
                                                  'end'
                                              ? Colors.red
                                              : controller.state.tripRoomModel!
                                                          .trip!.state ==
                                                      'start'
                                                  ? Colors.green
                                                  : Colors.amber,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.location_on),
                                    SizedBox(width: 10.w),
                                    Text(
                                      state.endAddress!,
                                      style: Get.textTheme.bodySmall!.copyWith(
                                        fontSize: 22.sp,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(),
                        Text(
                          "Passengers",
                          style: Get.textTheme.bodySmall!.copyWith(
                            fontSize: 25.sp,
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: controller
                                .state.tripRoomModel!.passengers!.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(vertical: 10.h),
                                child: PassengersWidget(
                                  passengers: controller
                                      .state.tripRoomModel!.passengers![index],
                                ),
                              );
                            },
                          ),
                        ),
                        Builder(
                          builder: (context) {
                            if (state.tripRoomModel!.trip!.state == 'waiting' ||
                                state.tripRoomModel!.trip!.state == 'start') {
                              return Padding(
                                padding: EdgeInsets.symmetric(vertical: 15.h),
                                child: Center(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      controller.sendRequest();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: Size(Get.width, 30.h),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.sp),
                                      ),
                                    ),
                                    child: Text(
                                      state.tripRoomModel!.trip!.state ==
                                              'waiting'
                                          ? "Start the Ride"
                                          : state.tripRoomModel!.trip!.state ==
                                                  'start'
                                              ? 'End the trip'
                                              : "View",
                                      style: Get.textTheme.bodySmall!.copyWith(
                                        color: Colors.white,
                                        fontSize: 25.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return Container();
                            }
                          },
                        )
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
    Get.delete<TripRoomController>();
    super.dispose();
  }
}
