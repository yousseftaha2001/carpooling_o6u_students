import 'package:carpooling_o6u_students/app/modules/track_location_map/track_location_map_controller.dart';
import 'package:carpooling_o6u_students/app/modules/trip_room/trip_room_controller.dart';
import 'package:carpooling_o6u_students/app/modules/trip_room/trip_room_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// import 'R';
class RateingDialog extends StatelessWidget {
  RateingDialog({Key? key}) : super(key: key);
  final controller = Get.find<TripRoomController>();

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
            "Rate your passengers",
            style: Get.textTheme.bodySmall,
          ),
          SizedBox(height: 20.h),
          SizedBox(
            height: 300.h,
            child: SingleChildScrollView(
              child: Wrap(
                // shrinkWrap: true,
                children: List.generate(
                  controller.state!.tripRoomModel!.passengers!.length,
                  (index) => ListTile(
                    // leading: Image.network(
                    //   controller.state.tripRoomModel!.passengers![index].photo!,
                    //   height: 50.h,
                    //   width: 50.h,
                    // ),
                    title: Text(
                      controller.state.tripRoomModel!.passengers![index].name!,
                      style: Get.textTheme.bodySmall!,
                    ),
                    trailing: RatingBar.builder(
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
                          id: controller
                              .state.tripRoomModel!.passengers![index].uId!
                              .toString(),
                          rate: rating.toInt(),
                        );
                        if(controller.state.rates.contains(rate)){
                          controller.state.rates.remove(rate);
                          controller.state.rates.add(rate);
                        }else{
                          controller.state.rates.add(rate);
                        }
                        print(controller.state.rates.first.id);
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          ElevatedButton(
            onPressed: () {
              if(controller.state.rates.isNotEmpty){
                TrackLocationMapController co=Get.find<TrackLocationMapController>();
                // controller.endTrip();
                co.ending();
              }
            },
            style: ElevatedButton.styleFrom(
              fixedSize: Size(Get.width / 2, 30.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.sp),
              ),
            ),
            child: Text(
              "End The Ride",
            ),
          )
        ],
      ),
    );
  }
}
