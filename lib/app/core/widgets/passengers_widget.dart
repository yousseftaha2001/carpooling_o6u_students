import 'package:carpooling_o6u_students/app/data/models/TripRoomModel.dart';
import 'package:carpooling_o6u_students/app/modules/trip_room/trip_room_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class PassengersWidget extends StatelessWidget {
  PassengersWidget({Key? key, required this.passengers}) : super(key: key);
  late Passengers passengers;
  final controller = Get.find<TripRoomController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Color.fromRGBO(234, 237, 252, 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
               ClipRRect(
                 borderRadius: BorderRadius.circular(100.sp),
                 child:  Image.network(passengers.photo!, height: 100.h),
               ),
                SizedBox(
                  width: 10.w,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '${passengers.name}',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.sp,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        '${passengers.uId}',
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          '${passengers.rateP}',
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 4.sp),
                        Icon(
                          Icons.star,
                          size: 25.sp,
                          color: const Color.fromRGBO(234, 205, 105, 1),
                        )
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        controller.callNumber(passengers.mobile!);
                      },
                      icon: Icon(
                        FontAwesomeIcons.phone,
                        size: 20.sp,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
