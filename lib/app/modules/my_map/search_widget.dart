import 'package:carpooling_o6u_students/app/modules/my_map/my_map_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SearchSection extends StatelessWidget {
  SearchSection({Key? key}) : super(key: key);
  MyMapController controller = Get.find<MyMapController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Center(
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Obx(() {
              return Flexible(
                child: TextField(
                  controller: controller.searchController,
                  style: TextStyle(
                    color: Get.theme.primaryColor,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: controller.searchMode.value ? IconButton(
                      onPressed: () {
                        // controller.search();
                        controller.searchController.clear();
                        controller.searchMode.value = false;
                        controller.autoCompleteRel = null;
                        FocusScopeNode currentFocus = FocusScope.of(context);
                        currentFocus.unfocus();
                      },
                      icon: Icon(Icons.close),
                    ) : null,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.sp),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.sp),
                      borderSide: BorderSide(color: Get.theme.primaryColor),
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
        SizedBox(height: 10.h),
        Obx(() {
          return !controller.searchMode.value
              ? Container()
              : Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.sp),
              ),
              child: Obx(() {
                return controller.getLocations.value
                    ? Center(
                  child: CircularProgressIndicator(),
                )
                    : controller.autoCompleteRel!=null? ListView.builder(
                  itemCount: controller
                      .autoCompleteRel!.predictions!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Icon(Icons.location_on),
                      onTap: () {
                        print(controller.autoCompleteRel!
                            .predictions![index].placeId!);
                        controller.changeLocationFromSearch(controller.autoCompleteRel!
                            .predictions![index].placeId!);
                      },
                      title: Text(
                        controller.autoCompleteRel!
                            .predictions![index].description!,
                        style: Get.textTheme.bodySmall!.copyWith(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.normal
                        ),
                      ),
                    );
                  },
                ):Center();
              }),
            ),
          );
        }),
      ],
    );
  }
}
