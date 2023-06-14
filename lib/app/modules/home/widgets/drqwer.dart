import 'package:carpooling_o6u_students/app/core/config/apis.dart';
import 'package:carpooling_o6u_students/app/core/helpers/local_data.dart';
import 'package:carpooling_o6u_students/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class DrawerScreen extends StatelessWidget {
  final logic = Get.find<HomeController>();

  // final state = Get.find<HomeController>().state;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GestureDetector(
        onTap: () {
          logic.closeDrawer();
        },
        child: Container(
          height: Get.height,
          decoration: BoxDecoration(
            color: Get.theme.primaryColor,
          ),
          child: Padding(
            padding: EdgeInsets.only(
                top: 50.h, left: 20.w, bottom: 0.h, right: 20.w),
            child: SizedBox(
              height: Get.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  SizedBox(height: 150.h),
                 Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Row(
                       children: [
                         ClipRRect(
                           borderRadius: BorderRadius.circular(200.sp),
                           child: Image.network(
                             '$photoAPI${MyDataBase.getStudentPhoto()}',
                             height: 100.h,
                             width: 100.h,
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Text(
                             MyDataBase.getStudnetId(),
                             style: Get.textTheme.bodySmall!.copyWith(
                               fontSize: 20.sp,
                               fontWeight: FontWeight.normal,
                               color: Colors.white,
                             ),
                           ),
                         ),
                       ],
                     ),


                     // SizedBox(height: 20.h),
                     Container(
                       // width: 250.w,
                       child: Divider(
                         color: Colors.white,
                         thickness: 2.sp,
                         // endIndent: 350.w,
                       ),
                     ),
                     SizedBox(height: 10.h),

                     NewRow(
                       text: 'Give Ride'.tr,
                       icon: FontAwesomeIcons.car,
                       ontap: () {
                         logic.isDrawerOpen
                             ? logic.closeDrawer()
                             : logic.openDrawer();
                         logic.cureentScreen.value = 0;
                       },
                     ),

                     SizedBox(height: 5.h),
                     NewRow(
                       text: 'Take  Ride'.tr,
                       icon:Icons.car_crash,
                       ontap: () {
                         logic.cureentScreen.value = 1;
                         logic.isDrawerOpen
                             ? logic.closeDrawer()
                             : logic.openDrawer();
                       },
                     ),
                     SizedBox(height: 5.h),
                     NewRow(
                       text: 'My Requests'.tr,
                       icon: Icons.ads_click_outlined,
                       ontap: () {
                         logic.cureentScreen.value = 2;
                         logic.isDrawerOpen
                             ? logic.closeDrawer()
                             : logic.openDrawer();
                         // state.cureentScreen.value=0;
                       },
                     ),
                     SizedBox(height: 5.h),
                     NewRow(
                       text: 'My Rides'.tr,
                       icon: Icons.ads_click_outlined,
                       ontap: () {
                         logic.cureentScreen.value = 3;
                         logic.isDrawerOpen
                             ? logic.closeDrawer()
                             : logic.openDrawer();
                         // state.cureentScreen.value=0;
                       },
                     ),
                   ],
                 ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      // logic.logoutMethod();
                      logic.logout();
                    },
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.logout_outlined,
                          color: Colors.white.withOpacity(0.5),
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          'Log out'.tr,
                          style: Get.textTheme.bodyText1!.copyWith(
                            color: Colors.white70,
                            fontSize: 20.sp,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NewRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback ontap;

  NewRow({
    Key? key,
    required this.icon,
    required this.text,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        color: Colors.transparent,
        // width: .w,
        height: 70.h,
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: Colors.white,
            ),
            SizedBox(width: 10.w),
            Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
