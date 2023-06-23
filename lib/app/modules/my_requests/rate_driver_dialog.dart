import 'package:carpooling_o6u_students/app/data/models/MyRequests.dart';
import 'package:carpooling_o6u_students/app/modules/my_requests/my_requests_controller.dart';
import 'package:carpooling_o6u_students/app/modules/track_location_map/track_location_map_controller.dart';
import 'package:carpooling_o6u_students/app/modules/trip_room/trip_room_controller.dart';
import 'package:carpooling_o6u_students/app/modules/trip_room/trip_room_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// import 'R';
class RateingDialogDriver extends StatelessWidget {
  RateingDialogDriver({Key? key,required this.requets}) : super(key: key);
  final controller = Get.find<MyRequestsController>();
  late Requets requets;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
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
      titlePadding: EdgeInsets.all(0),
      contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Rate your Driver",
            style: Get.textTheme.bodySmall,
          ),
          // SizedBox(height: 20.h),
          RatingBar.builder(
             initialRating: 3,
             itemSize: 20.sp,
             minRating: 1,
             direction: Axis.horizontal,
             allowHalfRating: false,
             itemCount: 5,
             itemPadding: EdgeInsets.symmetric(horizontal: 2),
             itemBuilder: (context, _) => Icon(
               Icons.star,
               color: Colors.amber,
             ),
             onRatingUpdate: (rating) {
               RateModel rate = RateModel(
                 id: requets.driverId
                     .toString(),
                 rate: rating.toInt(),
               );
               controller.driver=rate;

             },
           ),
          SizedBox(height: 20.h),
          ElevatedButton(
            onPressed: () {
              if(controller.driver!=null){
                // TrackLocationMapController co=Get.find<TrackLocationMapController>();
                // // controller.endTrip();
                // co.ending();
                controller.rateDriver(
                  id: requets.driverId.toString(),
                  rate: controller.driver!.rate!.toInt(),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              fixedSize: Size(Get.width / 2, 30.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.sp),
              ),
            ),
            child: Text(
              "Rate",
            ),
          )
        ],
      ),
    );
  }
}
