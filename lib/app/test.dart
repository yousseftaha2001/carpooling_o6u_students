import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TripDetailsScreen extends StatelessWidget {
  const TripDetailsScreen({Key? key}) : super(key: key);

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
            onPressed: (){},
          ),
          title: Text(
            'Arriving 8 mins',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(38, 58, 109, 1),
            ),
          ),
        ),
        body: Padding(
          padding:const EdgeInsets.all(20),
          child: Column(
            children: [
              HomeWorkPlaceWidget(),
              Padding(
                padding:const  EdgeInsets.all(50),
                child: Container(
                  color: Colors.grey,
                  height: 1,
                ),
              ),
              CarDetailsWidget(),
              SizedBox(height: 5,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 90),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  height: 1,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 30.h,),
             

            ],
          ),
        ),
      ),
    );
  }
}




class CarDetailsWidget extends StatelessWidget {
  const CarDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset('assets/images/car2.jpg'),
        SizedBox(width: 10.w,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'HatchBack',
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
              ),
            ),
            SizedBox(height: 5.h,),
            Row(
              children: [
                const Icon(Icons.access_time_outlined,color: Colors.grey,),
                SizedBox(width: 5.w,),
                Text(
                  '8 mins',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h,),
            Row(
              children: [
                const Icon(Icons.person,color: Colors.grey,),
                SizedBox(width: 5.w,),
                Text(
                  '2 passengers',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h,),
          ],
        ),
        Column(
          children: [
            Text(
              '7 Km',
              style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
              ),
            ),
            TextButton(
                onPressed: (){},
                child: Text(
                  'Change Ride',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Color.fromRGBO(74, 115, 218, 1),
                  ),
                )
            )
          ],
        )

      ],
    );
  }
}




class HomeWorkPlaceWidget extends StatelessWidget {
  const HomeWorkPlaceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color:const Color.fromRGBO(238, 241, 255, 1)
      ),
      child:Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Row(
              children: [
                SizedBox(width: 20.w,),
                Image.asset('assets/images/location.png',),
                SizedBox(width: 20.w,),
                Text(
                  'Home',
                  style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.grey
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.w),
            child: Container(
                color: Colors.grey,
                height: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Stack(
                      children: [
                        Image.asset('assets/images/Rectangle 979.png'),
                        Image.asset('assets/images/arrows.png')
                      ],
                    )
                  ],
                )
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Row(
              children: [
                SizedBox(width: 20.w,),
                Image.asset('assets/images/circle.png',),
                SizedBox(width: 20.w,),
                Text(
                  'Work Place',
                  style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.grey
                  ),
                )
              ],
            ),
          ),
        ],
      ) ,
    );
  }
}