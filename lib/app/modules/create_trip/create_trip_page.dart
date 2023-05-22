import 'package:carpooling_o6u_students/app/modules/my_map/my_map_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'create_trip_controller.dart';

class CreateTripPage extends GetView<CreateTripController> {
  CreateTripPage({super.key});
  CreateTripController controller = Get.put(CreateTripController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.h),
                Obx(
                  () => CheckboxListTile(
                    value: controller.toUniversity.value,
                    onChanged: (bool? newValue) {
                      controller.toUniversity.value = newValue!;
                    },
                    title: Text(
                      "To University",
                      style: Get.textTheme.bodyMedium,
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Obx(
                    () => DropdownButton(
                      isExpanded: true,
                      style: Get.textTheme.bodySmall,
                      value: controller.carType.value == ''
                          ? null
                          : controller.carType.value,
                      hint: Text("Car Type"),
                      items: List.generate(
                        controller.carTypes.length,
                        (index) => DropdownMenuItem(
                          value: controller.carTypes[index],
                          child: Text(
                            controller.carTypes[index],
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        controller.carType.value = value!;
                      },
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                TextField(
                  // readOnly: true,
                   style: TextStyle(color: Colors.black),
                  controller: controller.carNum,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.sp),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.sp),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),

                    prefixIcon: Icon(Icons.car_rental),

                    // suffixIcon:  Icon(Icons.),
                    hintText: 'Car Num',
                    fillColor: Colors.grey.withOpacity(0.2),
                    filled: true,
                  ),
                ),
                SizedBox(height: 15.h),
                TextField(
                  // readOnly: true,
                  controller: controller.seats,
 style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.sp),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.sp),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),

                    prefixIcon: Icon(Icons.car_rental),

                    // suffixIcon:  Icon(Icons.),
                    hintText: 'available seats',
                    fillColor: Colors.grey.withOpacity(0.2),
                    filled: true,
                  ),
                ),
                SizedBox(height: 15.h),
                Obx(
                  () => TextField(
                    readOnly: true,
                    style: TextStyle(color: Colors.black),
                    controller: controller.startLocation,
                    onTap: () {
                      print("object");
                      Get.to(
                        () => MyMapPage(
                          destination: "createTrip",
                        ),
                      );
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.sp),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.sp),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),

                      prefixIcon: Icon(Icons.location_pin),

                      // suffixIcon:  Icon(Icons.),
                      hintText: controller.toUniversity.value
                          ? 'Pick Start Location'
                          : 'Pick End Location',
                      fillColor: Colors.grey.withOpacity(0.2),
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                TextField(
                  readOnly: true,
                  onTap: () {
                    print("object");
                    controller.pickDate();
                  },
                  controller: controller.startTime,
                   style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.sp),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.sp),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),

                    prefixIcon: Icon(Icons.share_arrival_time),

                    // suffixIcon:  Icon(Icons.),
                    hintText: 'Start Time',
                    fillColor: Colors.grey.withOpacity(0.2),
                    filled: true,
                  ),
                ),
                SizedBox(height: 15.h),
                TextField(
                  readOnly: true,
                   onTap: () {
                    print("object");
                    controller.pickEndTime();
                  },
                  controller: controller.endTime,
                   style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.sp),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.sp),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),

                    prefixIcon: Icon(Icons.share_arrival_time),

                    // suffixIcon:  Icon(Icons.),
                    hintText: 'End Time',
                    fillColor: Colors.grey.withOpacity(0.2),
                    filled: true,
                  ),
                ),
                SizedBox(height: 15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        controller.pickerImage();
                      },
                      child: Text(
                        "Add Car Photo",
                        style: Get.textTheme.bodySmall!.copyWith(
                          color: Get.theme.primaryColor,
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100.sp),
                      child: GetBuilder<CreateTripController>(
                        id: 'image',
                        builder: (c) {
                          return c.carImage == null
                              ? Image.asset(
                                  "assets/2554936.png",
                                  fit: BoxFit.cover,
                                  height: 100.h,
                                  width: 100.h,
                                )
                              : Image.file(
                                  c.carImage!,
                                  fit: BoxFit.cover,
                                  height: 100.h,
                                  width: 100.h,
                                );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 45.h),
                ElevatedButton(
                  onPressed: () {
                    controller.createTime();
                  },
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
