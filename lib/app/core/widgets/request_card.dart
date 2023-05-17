import 'package:carpooling_o6u_students/app/core/config/apis.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../modules/ride_requests/ride_requests_controller.dart';

class RequestCard extends StatelessWidget {
   RequestCard({Key? key,required this.index}) : super(key: key);

   late int index;
   RideRequestsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0.sp),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(234, 237, 252, 1),
          borderRadius: BorderRadius.circular(20.sp),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.0.sp),
          child: Column(
            children: [



              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 150.w,
                    child: Text(
                      controller.state.requests!.requets![index].name!,
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
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                       Icon(
                        Icons.star,
                        size: 35.sp,
                        color: Color.fromRGBO(234, 205, 105, 1),
                      ),
                      Text(
                        controller.state.requests!.requets![index].rateP!.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      CircleAvatar(
                        radius: 40.sp,
                        child: Image.network('$photoAPI${controller.state.requests!.requets![index].photo!}',),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                ],
              ),

              Container(
                height: 1.h,
                color: Colors.grey,
              ),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Padding(
                   padding: EdgeInsets.all(10.sp),
                   child: TextButton(
                     onPressed: () {
                       controller.acceptRequest(index: index);

                     },
                     child: Text(
                       'Accept',
                       style: TextStyle(
                         fontSize: 20.sp,
                         fontWeight: FontWeight.bold,
                         color: Get.theme.primaryColor,
                       ),
                     ),
                   ),
                 ),

                 Padding(
                   padding: EdgeInsets.all(10.sp),
                   child: TextButton(
                     onPressed: () {


                     },
                     child: Text(
                       'Reject',
                       style: TextStyle(
                         fontSize: 20.sp,
                         fontWeight: FontWeight.bold,
                         color: Colors.red,
                       ),
                     ),
                   ),
                 ),
               ],
             )
            ],
          ),
        ),
      ),
    );

  }
}
