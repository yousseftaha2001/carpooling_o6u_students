import 'package:carpooling_o6u_students/app/modules/notification_api.dart';
import 'package:carpooling_o6u_students/app/modules/signup/signup_page.dart';
import 'package:carpooling_o6u_students/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/widgets/custom_text.dart';
import 'login_page_controller.dart';

class LoginPagePage extends GetView<LoginPageController> {
  LoginPagePage({super.key});
  LoginPageController controller = Get.put(LoginPageController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: Get.height,
          width: Get.width,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 30.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      "assets/login.png",
                      height: Get.height / 4,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Login",
                        style: Get.textTheme.bodySmall!.copyWith(
                          color: Get.theme.primaryColor,
                          fontSize: 40.sp,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Container(
                          height: 5.h,
                          width: Get.width / 8,
                          decoration: BoxDecoration(
                            color: Get.theme.primaryColor,
                            borderRadius: BorderRadius.circular(10.sp),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.height / 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MyInput(
                          hint: "Student ID",
                          icon: Icons.card_membership,
                          controller: controller.id,
                          textInputType: TextInputType.number,
                          function: (e) {
                            controller.updateButton();
                          },
                        ),
                        MyInput(
                          hint: "Password",
                          icon: Icons.lock_outline,
                          textInputType: TextInputType.number,
                          show: false,
                          controller: controller.password,
                          function: (e) {
                            controller.updateButton();
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.h),
                  GetBuilder<LoginPageController>(
                    id: 'button',
                    builder: (controller) {
                      return ElevatedButton(
                        onPressed: controller.buttonState()
                            ? () {
                                controller.login();
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(Get.width, 50.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.sp),
                          ),
                          disabledBackgroundColor: Colors.grey,
                        ),
                        child: Text(
                          "Login",
                          style: Get.textTheme.bodySmall!.copyWith(
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      );
                    },
                  ),
                  // Spacer(),
                  SizedBox(height: Get.height / 7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "New Here?",
                        style: Get.textTheme.bodySmall!.copyWith(
                            // color: Get.theme.primaryColor,
                            ),
                      ),
                      TextButton(
                        onPressed: () async{
                          Get.to(() => SignupPage());
                          //  NotificationApi.showNoti();
                          
                           
                        },
                        child: Text(
                          "Sign up",
                          style: Get.textTheme.bodySmall!.copyWith(
                            color: Get.theme.primaryColor,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
