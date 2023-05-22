import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class RideDetailsScreen extends StatelessWidget {
  const RideDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon:const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: (){
                // Get.to(TripDetailsScreen());
              },
            ),
            title: Text(
              'Arriving in 8 mins',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color:const Color.fromRGBO(38, 58, 109, 1),
                  fontSize: 24.sp
              ),
            ),
          ),
          body: Padding(
            padding:const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h,),
                  Text(
                    'Driver',
                    style: TextStyle(
                        fontSize: 21.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 30.h,),
                  // DriverContainer(),
                  SizedBox(height: 30.sp,),
                  Text(
                    'Co-Passenger',
                    style: TextStyle(
                        fontSize: 21.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 20.sp,),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder:(context,index)=> CoPassengerWidget(),
                    separatorBuilder: (context,index)=>SizedBox(height: 15.sp,),
                    itemCount: 4,
                  ),
                  SizedBox(height: 30.h,),
                  Center(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          minimumSize: const Size(200, 40),

                        ),

                        onPressed: (){},
                        child: Text(
                          'view on map',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp
                          ),
                        )
                    ),
                  )

                ],
              ),
            ),
          ),
        )
    );
  }
}




class CoPassengerWidget extends StatelessWidget {
  const CoPassengerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:const BoxDecoration(
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
                // Image.asset('assets/images/Frame 10.png'),
                SizedBox(width: 10.w,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'passenger',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp
                          ),
                        ),
                        SizedBox(width: 10.w,),
                        Icon(Icons.person,color: Colors.grey,),
                      ],
                    ),
                    SizedBox(height: 10.h,),
                    Row(
                      children: [
                        // Image.asset('assets/images/pase.png'),
                        SizedBox(width: 6.sp,),
                        Text(
                          'Tcs,delhi',
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    Text(
                      '4.8',
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.black
                      ),
                    ),
                    SizedBox(width: 4.sp,),
                    const Icon(
                      Icons.star,
                      color: Color.fromRGBO(234, 205, 105, 1),
                    )

                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );;
  }
}