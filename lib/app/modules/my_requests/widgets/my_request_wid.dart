import 'package:carpooling_o6u_students/app/core/config/apis.dart';
import 'package:carpooling_o6u_students/app/modules/my_requests/my_requests_controller.dart';
import 'package:carpooling_o6u_students/app/modules/my_requests/rate_driver_dialog.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../core/helpers/global_dun.dart';

class ReqWidget extends StatelessWidget {
  ReqWidget({Key? key, required this.index}) : super(key: key);
  late int index;
  MyRequestsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0.sp),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30.sp),
              bottomLeft: Radius.circular(30.sp),
            ),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 10.sp)
            ]),
        child: Padding(
          padding: EdgeInsets.all(10.0.sp),
          child: Column(
            children: [
              SizedBox(height: 10.h),
              Icon(
                Icons.circle,
                color: controller.requests!.requets![index].tripsState ==
                        'waiting'
                    ? Colors.yellow
                    : controller.requests!.requets![index].tripsState == 'start'
                        ? Colors.green
                        : Colors.red,
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      '$photoAPI${controller.requests!.requets![index].carPhoto!}',
                    ),
                    radius: 40.sp,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${controller.requests!.requets![index].carType}",
                          style: Get.textTheme.bodyLarge!.copyWith(
                            fontSize: 20.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "${controller.requests!.requets![index].carNum}",
                              style: Get.textTheme.bodyLarge!.copyWith(
                                fontSize: 17.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Icon(
                        Icons.attach_money,
                        color: Get.theme.primaryColor,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 0.w),
                        child: Text(
                          '2 EGP/KG',
                          style: Get.textTheme.bodyMedium!.copyWith(
                            fontSize: 16.sp,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Column(
                    children: [
                      Icon(FontAwesomeIcons.carOn),
                      SizedBox(
                        height: 30.h,
                      ),
                      Icon(EvaIcons.pin),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${controller.startAd}",
                        style: Get.textTheme.bodyLarge!.copyWith(
                          fontSize: 18.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(height: 30.h),
                      Text(
                        "${controller.endAd}",
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
              Divider(thickness: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.peopleGroup,
                        color: Get.theme.primaryColor,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: Text(
                          "${controller.requests!.requets![index].seats}",
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.timelapse,
                        color: Get.theme.primaryColor,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: Text(
                          GlobalFunctions.formatTime(
                            controller.requests!.requets![index].startTime!,
                          ),
                          style: Get.textTheme.bodyMedium!.copyWith(
                            fontSize: 16.sp,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),

              SizedBox(height: 20.h),
              // Text(
              //   "request state: ${controller.requests!.requets![index].tripsState!}",
              //   style: Get.textTheme.bodySmall,
              // ),
              Builder(builder: (c) {
                if (controller.requests!.requets![index].state == 'waiting') {
                  return Text(
                    "request state: ${controller.requests!.requets![index].state!}",
                    style: Get.textTheme.bodySmall,
                  );
                } else if (controller.requests!.requets![index].state ==
                    'accepted') {
                  if (controller.requests!.requets![index].takeen == 0) {
                    return TextButton(
                      onPressed: () {
                        controller.endTrip(controller
                            .requests!.requets![index]!.id
                            .toString());
                      },
                      child: Text(
                        "Ride",
                      ),
                    );
                  } else {
                    if (controller.requests!.requets![index].tripsState ==
                        'end') {
                      return Row(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.money),
                              Text((controller.clacDistance(controller
                                              .requests!.requets![index]) *
                                          2)
                                      .toStringAsFixed(2)
                                      .toString() +
                                  ' EGP')
                            ],
                          ),
                          Spacer(),
                          TextButton(
                            onPressed: () {
                              Get.dialog(
                                RateingDialogDriver(
                                    requets:
                                        controller.requests!.requets![index]!),
                              );
                            },
                            child: Text("Rate the driver!"),
                          )
                        ],
                      );
                    } else {
                      return Center();
                    }
                  }
                } else {
                  return Center();
                }
              }),

              // ElevatedButton(
              //   onPressed: () {
              //     controller.sendRequest(id: controller.tripsModel!.trips![index].id!.toString());
              //   },
              //   style: ElevatedButton.styleFrom(
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(10.sp),
              //       )
              //   ),
              //   child: Text("Send Request"),
              //
              // ),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     Text(
              //       "EGP",
              //       style: Get.textTheme.bodySmall!.copyWith(
              //         fontWeight: FontWeight.normal,
              //       ),
              //     ),
              //     SizedBox(width: 10.w),
              //     Text(
              //       "2/KM",
              //       style: Get.textTheme.bodySmall!.copyWith(
              //         fontSize: 22.sp,
              //         fontWeight: FontWeight.normal,
              //       ),
              //     )
              //   ],
              // ),

              SizedBox(height: 10.h),
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: [
              //     Column(
              //       children: [
              //         Text(
              //           "${controller.tripsModel!.trips![index].carType}",
              //           style: TextStyle(
              //             fontSize: 18.sp,
              //             fontWeight: FontWeight.bold,
              //             color: Colors.black,
              //           ),
              //         ),
              //         SizedBox(height: 10.h),
              //         Image.network('${controller.tripsModel!.trips![index].carPhoto}', height: 80.h),
              //       ],
              //     ),
              //     SizedBox(width: 10.w),
              //     Column(
              //       mainAxisAlignment: MainAxisAlignment.end,
              //       children: [
              //         Text(
              //           "${controller.tripsModel!.trips![index].carNum}",
              //           style: TextStyle(color: Colors.black, fontSize: 14.sp),
              //         ),
              //         SizedBox(height: 5.h),
              //         Text(
              //           "${controller.tripsModel!.trips![index].seats}",
              //           style: TextStyle(
              //             color: Colors.black,
              //             fontSize: 14.sp,
              //             fontWeight: FontWeight.bold,
              //           ),
              //         ),
              //       ],
              //     ),
              //     Spacer(),
              //     Column(
              //       children: [
              //         SizedBox(width: 5.w),
              //         Image.network('${controller.tripsModel!.trips![index].driverPhoto}', height: 70.h),
              //         Column(
              //           mainAxisAlignment: MainAxisAlignment.end,
              //           children: [
              //             SizedBox(
              //               width: 150.w,
              //               child: Text(
              //                 "${controller.tripsModel!.trips![index].driverName}",
              //                 textAlign: TextAlign.center,
              //                 style: TextStyle(
              //                   color: Colors.black,
              //                   fontSize: 20.sp,
              //                   fontWeight: FontWeight.bold,
              //                   overflow: TextOverflow.fade,
              //                 ),
              //                 softWrap: true,
              //               ),
              //             ),
              //             SizedBox(height: 5.h),
              //             Row(
              //               children: [
              //                 const Icon(
              //                   Icons.star,
              //                   color: Color.fromRGBO(234, 205, 105, 1),
              //                 ),
              //                 Text(
              //                   "${controller.tripsModel!.trips![index].driverRate}",
              //                   style: TextStyle(
              //                     color: Colors.black,
              //                     fontSize: 14.sp,
              //                     fontWeight: FontWeight.bold,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ],
              //         ),
              //       ],
              //     ),
              //   ],
              // ),
              // SizedBox(height: 20.h),
              // Container(
              //   height: 1.h,
              //   color: Colors.grey,
              // ),
              // Padding(
              //   padding: EdgeInsets.all(10.sp),
              //   child: TextButton(
              //     onPressed: () {
              //
              //       controller.sendRequest(id: controller.tripsModel!.trips![index].id!.toString());
              //     },
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         Text(
              //           'Send Request',
              //           style: TextStyle(
              //             fontSize: 20.sp,
              //             fontWeight: FontWeight.bold,
              //             color: Get.theme.primaryColor,
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

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
            controller.requests!.requets![index].state == 'waiting'
                ? Text("${controller.requests!.requets![index].state!}")
                : TextButton(
                    onPressed: () {
                      controller.endTrip(
                          controller.requests!.requets![index]!.id.toString());
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
