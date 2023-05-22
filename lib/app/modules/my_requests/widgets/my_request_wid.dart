import 'package:carpooling_o6u_students/app/modules/my_requests/my_requests_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class MyRequestWidget extends StatelessWidget {
  MyRequestWidget({super.key, required this.index});
  MyRequestsController controller = Get.find();
  late int index;

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
                      width: Get.width / 1.5,
                      child: Text(
                        controller.requests!.requets![index].startLocation!,
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
                      width: Get.width / 1.5,
                      child: Text(
                        controller.requests!.requets![index].endLocation!,
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
                    Text(controller.requests!.requets![index].carType!),
                    Image.asset("assets/2554936.png", height: 100.h)
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.person),
                    Text(
                      controller.requests!.requets![index].seats!.toString(),
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
            controller.requests!.requets![index].state == 'wait'
                ? Text("${controller.requests!.requets![index].state!}")
                : TextButton(
                    onPressed: () {
                      controller.endTrip(controller.requests!.requets![index]!.id.toString());
                    },
                    child: Text(
                      "Ride",
                      
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
