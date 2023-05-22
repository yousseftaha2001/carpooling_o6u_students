import 'dart:io';

import 'package:carpooling_o6u_students/app/core/widgets/circular_dialog.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../data/services/cretae_trip.dart';

class CreateTripController extends GetxController {
  //TODO: Implement CreateTripController.

  RxBool toUniversity = false.obs;
  List<String> carTypes = [
    "Sports",
    "Crossover",
    "Sedan",
    "Coupe",
    "Hatchback",
  ];

  late TextEditingController carNum;
  late TextEditingController seats;
  late TextEditingController startLocation;
  late TextEditingController startTime;
  late TextEditingController endTime;
  RxString carType = ''.obs;
  File? carImage;
  Future<void> pickerImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: false,
      allowedExtensions: ['jpg', 'pdf', 'doc'],
    );
    if (result != null) {
      print(result.paths);
      carImage = File(result.files.first.path!);
      update(["image", "button"]);
    } else {}
  }

  void pickDate() async {
    var date = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 5)),
    );
    if (date != null) {
      var time = await showTimePicker(
        context: Get.context!,
        initialTime: TimeOfDay.now(),
      );
      if (time != null) {
        DateTime dateTime =
            DateTime(date.year, date.month, date.day, time.hour, time.minute);
        print(dateTime);
        startTime.text = dateTime.toString();
      }
    }
  }

  void pickEndTime() async {
    var date = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 5)),
    );
    if (date != null) {
      var time = await showTimePicker(
        context: Get.context!,
        initialTime: TimeOfDay.now(),
      );
      if (time != null) {
        DateTime dateTime =
            DateTime(date.year, date.month, date.day, time.hour, time.minute);
        print(dateTime);
        endTime.text = dateTime.toString();
      }
    }
  }

  void createTime() async {
    if (carType.value.isNotEmpty &&
        carNum.text.isNotEmpty &&
        seats.text.isNotEmpty &&
        startLocation.text.isNotEmpty &&
        endTime.text.isNotEmpty &&
        startTime.text.isNotEmpty) {
      Get.dialog(
        CircularDialog(),
        barrierDismissible: false,
      );
      var result = await CreateTripServices.createTrip(
        seats: seats.text,
        carTypes: carType.value,
        carNum: carNum.text,
        startTime: startTime.text,
        endTime: endTime.text,
        startLocation: toUniversity.value
            ? startLocation.text
            : '29.976420135132464,30.947393139091833',
        endLocation: toUniversity.value
            ? '29.976420135132464,30.947393139091833'
            : startLocation.text,
        photo: carImage!.readAsBytesSync(),
      );
      result.fold(
        (l) {
          print(l);
          Get.back();
          Get.snackbar("Error", l);
        },
        (r) {
          Get.back();
          // Get.snackbar("Done", "Done");
          Get.back();
          Get.dialog(AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.check,color: Colors.green,size: 50.sp,),
                Text(
                  "Done your trip has been uploaded",
                  style: Get.textTheme.bodyMedium,
                )
              ],
            ),
          ));
        },
      );
    }
  }

  @override
  void onInit() {
    super.onInit();
    carNum = TextEditingController();
    seats = TextEditingController();
    startLocation = TextEditingController();
    endTime = TextEditingController();
    startTime = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
