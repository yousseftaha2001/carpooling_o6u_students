import 'package:carpooling_o6u_students/app/modules/all_trips/all_trips_controller.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TripAds extends StatelessWidget {
  TripAds({Key? key, required this.index}) : super(key: key);
  late int index;
  AllTripsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(10.0.sp),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(234, 237, 252, 1),
          borderRadius: BorderRadius.circular(20.sp),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.0.sp),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "EGP",
                    style: Get.textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    "2/KM",
                    style: Get.textTheme.bodySmall!.copyWith(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.normal,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Icon(Icons.location_on_outlined),
                      SizedBox(
                        height: 60.h,
                        child: VerticalDivider(
                          width: 10.w,
                          color: Colors.black,
                        ),
                      ),
                      Icon(EvaIcons.pin),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${controller.tripsModel!.trips![index].startLocation}",
                        style: Get.textTheme.bodyLarge!.copyWith(
                          fontSize: 18.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(height: 60.h),
                      Text(
                        "${controller.tripsModel!.trips![index].endLocation}",
                        style: Get.textTheme.bodyLarge!.copyWith(
                          fontSize: 18.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        "${controller.tripsModel!.trips![index].carType}",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Image.asset('assets/give_ride.png', height: 50.h),
                    ],
                  ),
                  SizedBox(width: 10.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "${controller.tripsModel!.trips![index].carNum}",
                        style: TextStyle(color: Colors.black, fontSize: 14.sp),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        "${controller.tripsModel!.trips![index].seats}",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      SizedBox(width: 5.w),
                      Image.asset('assets/download.png', height: 70.h),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 150.w,
                            child: Text(
                              "${controller.tripsModel!.trips![index].driverName}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.fade,
                              ),
                              softWrap: true,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Color.fromRGBO(234, 205, 105, 1),
                              ),
                              Text(
                                "${controller.tripsModel!.trips![index].driverRate}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Container(
                height: 1.h,
                color: Colors.grey,
              ),
              Padding(
                padding: EdgeInsets.all(10.sp),
                child: TextButton(
                  onPressed: () {

                    controller.sendRequest(id: controller.tripsModel!.trips![index].id!.toString());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Send Request',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Get.theme.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
