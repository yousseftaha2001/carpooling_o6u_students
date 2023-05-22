import 'package:carpooling_o6u_students/app/modules/all_trips/all_trips_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class TripCard extends StatelessWidget {
   TripCard({super.key,required this.index});
   late int index;
   AllTripsController controller=Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: Get.height / 6,
      width: Get.width,
      decoration: BoxDecoration(
        color: Color(0xffEAEDFC),
        borderRadius: BorderRadius.circular(10.sp),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.location_on),
                    SizedBox(width: 10.w),
                    Container(
                      width: Get.width/1.5,
                      child: Text(
                        controller.tripsModel!.trips![index].startLocation!,
                        style: Get.textTheme.bodySmall!.copyWith(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.normal,
                          
                        ),
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(FontAwesomeIcons.locationArrow),
                    SizedBox(width: 10.w),
                    Container(
                      width: Get.width/1.5,
                      child: Text(
                        controller.tripsModel!.trips![index].endLocation!,
                        style: Get.textTheme.bodySmall!.copyWith(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.normal,
                          
                        ),
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(controller.tripsModel!.trips![index].carType!),
                    Image.asset("assets/2554936.png", height: 100.h)

                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(controller.tripsModel!.trips![index].driverName!),
                            Row(
                              children: [
                                Icon(Icons.star),
                                Text(
                                 controller.tripsModel!.trips![index].driverRate!.toString(),
                                  style: Get.textTheme.bodySmall!.copyWith(
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Image.asset(
                            "assets/download.png",
                            height: 90.h,
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.person),
                    Text(
                      controller.tripsModel!.trips![index].seats!.toString(),
                      style: Get.textTheme.bodySmall!.copyWith(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
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
              ],
            ),
            Divider(color: Colors.black),
            OutlinedButton(
              onPressed: () {
                controller.sendRequest(id: controller.tripsModel!.trips![index].id!.toString());
              },
              style: OutlinedButton.styleFrom(fixedSize: Size(Get.width, 30.h)),
              child: Text(
                "Send Request",
              ),
            )
          ],
        ),
      ),
    );
  }
}
