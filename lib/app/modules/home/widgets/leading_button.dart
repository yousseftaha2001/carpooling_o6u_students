import 'package:carpooling_o6u_students/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class LeadingButton extends StatelessWidget {
  const LeadingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (logic) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(
                logic.isDrawerOpen
                    ? Icons.arrow_back_ios
                    : FontAwesomeIcons.list,
                color: Get.theme.primaryColor,
              ),
              onPressed: () {
                logic.isDrawerOpen
                    ? logic.closeDrawer()
                    : logic.openDrawer();
                FocusScopeNode currentFocus = FocusScope.of(context);

                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
            ),
          ],
        );
      },
    );
  }
}