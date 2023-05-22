import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class CircularDialog extends StatelessWidget {
  const CircularDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SpinKitSpinningLines(
            color: Get.theme.primaryColor,
          )
        ],
      ),
    );
  }
}

class InfoDialog extends StatelessWidget {
  InfoDialog({super.key, required this.error, required this.title});

  final IconData title;
  final String error;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.sp)),
      title:Icon(title,size: 50.sp,),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            error,
            style: Get.textTheme.bodyMedium!.copyWith(
              fontSize: 22.sp,
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text("Back"),
        )
      ],
    );
  }
}
