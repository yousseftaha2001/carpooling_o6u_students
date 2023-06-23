import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/widgets/custom_text.dart';
import 'signup_controller.dart';

class SignupPage extends GetView<SignupController> {
  SignupPage({super.key});

  SignupController controller = Get.put(SignupController());

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
                  Center(child: Image.asset("assets/signup.png")),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sign Up",
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          controller.pickerImage();
                          // controller.getAddress(29.98112127219477, 30.95062803558721);
                        },
                        child: Text(
                          "Add Photo",
                          style: Get.textTheme.bodySmall!.copyWith(
                            color: Get.theme.primaryColor,
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100.sp),
                        child: GetBuilder<SignupController>(
                          id: 'image',
                          builder: (c) {
                            return c.studentImage == null
                                ? Image.asset(
                                    "assets/download.png",
                                    fit: BoxFit.cover,
                                    height: 100.h,
                                    width: 100.h,
                                  )
                                : Image.file(
                                    c.studentImage!,
                                    fit: BoxFit.cover,
                                    height: 100.h,
                                    width: 100.h,
                                  );
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.height / 3,
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
                          hint: "Name",
                          icon: Icons.person_outlined,
                          textInputType: TextInputType.text,
                          controller: controller.name,
                          function: (e) {
                            controller.updateButton();
                          },
                        ),
                        MyInput(
                          hint: "Phone Number",
                          icon: Icons.card_membership,
                          textInputType: TextInputType.number,
                          controller: controller.phone,
                          function: (e) {
                            controller.updateButton();
                          },
                        ),
                        MyInput(
                          hint: "Password",
                          icon: Icons.lock_outline,
                          textInputType: TextInputType.number,
                          controller: controller.password,
                          show:false,
                          function: (e) {
                            controller.updateButton();
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.h),
                  GetBuilder<SignupController>(
                      id: 'button',
                      builder: (controller) {
                        return ElevatedButton(
                          onPressed: controller.buttonState()
                              ? () {
                                  controller.continueButton();
                                  // controller.getAddress(
                                  //     30.030306471220626, 30.995920918459735);
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
                            "Continue",
                            style: Get.textTheme.bodySmall!.copyWith(
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        );
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
