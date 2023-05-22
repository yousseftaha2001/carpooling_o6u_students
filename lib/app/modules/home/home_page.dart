import 'package:carpooling_o6u_students/app/core/helpers/local_data.dart';
import 'package:carpooling_o6u_students/app/modules/all_trips/all_trips_page.dart';
import 'package:carpooling_o6u_students/app/modules/my_rides/my_rides_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../create_trip/create_trip_page.dart';
import '../my_requests/my_requests_page.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  HomePage({super.key});
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('HomePage'),
      //   centerTitle: true,
      // ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: Get.height,
              width: Get.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/Group 29586.png"),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.dialog(
                              AlertDialog(
                                title: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      icon: Icon(
                                        Icons.close,
                                      ),
                                    )
                                  ],
                                ),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "Logout?",
                                      style: Get.textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      controller.logout();
                                    },
                                    child: Text("Yes"),
                                  )
                                ],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.sp)
                                ),
                              ),
                              
                              barrierDismissible: false,
                            );
                          },
                          icon: Icon(
                            Icons.logout,
                            size: 40.sp,
                          ),
                        ),
                        Text("Hello, ${MyDataBase.getStudnetId()}")
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => CreateTripPage());
                      },
                      child: Container(
                        height: Get.height / 3,
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: Color(0xffBADDF5),
                          borderRadius: BorderRadius.circular(60.sp),
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: Get.height / 4,
                              width: Get.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(60.sp),
                                image: const DecorationImage(
                                  image: AssetImage(
                                    "assets/give_ride.png",
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 20.h),
                              child: Text("Give Ride"),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 80.h),
                    GestureDetector(
                      onTap: () {
                        
                        Get.to(()=>AllTripsPage());
                      },
                      child: Container(
                        height: Get.height / 3,
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: Color(0xffBADDF5),
                          borderRadius: BorderRadius.circular(60.sp),
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: Get.height / 4,
                              width: Get.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(60.sp),
                                image: const DecorationImage(
                                  image: AssetImage(
                                    "assets/takeride.png",
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 20.h),
                              child: Text("Take Ride"),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 80.h),
                    GestureDetector(
                      onTap: () {
                        
                        Get.to(()=>MyRequestsPage());
                      },
                      child: Container(
                        height: Get.height / 3,
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: Color(0xffBADDF5),
                          borderRadius: BorderRadius.circular(60.sp),
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: Get.height / 4,
                              width: Get.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(60.sp),
                                image: const DecorationImage(
                                  image: AssetImage(
                                    "assets/takeride.png",
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 20.h),
                              child: Text("Show All Requests"),
                            )
                          ],
                        ),
                      ),
                    ), SizedBox(height: 80.h),
                    GestureDetector(
                      onTap: () {

                        Get.to(()=>MyRidesPage());
                      },
                      child: Container(
                        height: Get.height / 3,
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: Color(0xffBADDF5),
                          borderRadius: BorderRadius.circular(60.sp),
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: Get.height / 4,
                              width: Get.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(60.sp),
                                image: const DecorationImage(
                                  image: AssetImage(
                                    "assets/takeride.png",
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 20.h),
                              child: Text("My All Rides"),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
