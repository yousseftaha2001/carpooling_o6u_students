import 'package:carpooling_o6u_students/app/modules/home/home_controller.dart';
// import 'package:ejarkom/app/home/logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final logic = Get.find<HomeController>();

  // final state = Get.find<HomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if(logic.isDrawerOpen){
          logic.closeDrawer();
          return false;
        }else if(logic.cureentScreen.value==0){
          logic.closeDrawer();
          return true;
        }
        logic.closeDrawer();
        logic.cureentScreen.value = 0;
        return false;
      },
      child: GetBuilder<HomeController>(
        builder: (logic) {
          return AnimatedContainer(
            transform: Matrix4.translationValues(logic.xOffset, logic.yOffset, 0)
              ..scale(logic.isDrawerOpen ? 0.85 : 1.00)
              ..rotateZ(logic.isDrawerOpen ? 0 : 0),
            duration: Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: logic.isDrawerOpen
                  ? BorderRadius.circular(40.sp)
                  : BorderRadius.circular(0.sp),
            ),
            child: ClipRRect(
              child: Obx(
                () => logic.screens[logic.cureentScreen.value],
              ),
              borderRadius: logic.isDrawerOpen
                  ? BorderRadius.circular(40.sp)
                  : BorderRadius.circular(0.sp),
            ),
          );
        },
      ),
    );
  }
}
