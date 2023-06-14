import 'dart:async';

import 'package:carpooling_o6u_students/app/core/widgets/custom_text.dart';
import 'package:carpooling_o6u_students/app/modules/my_map/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'my_map_controller.dart';

class MyMapPage extends StatefulWidget {
  MyMapPage({super.key, this.destination});

  String? destination;

  @override
  State<MyMapPage> createState() => _MyMapPageState();
}

class _MyMapPageState extends State<MyMapPage> {
  late MyMapController pageC;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageC = Get.put(MyMapController(destination: widget.destination ?? ''));
    // drawPoly();
  }

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            GetBuilder<MyMapController>(
              id: "map",
              builder: (contro) {
                return GoogleMap(
                  mapType: MapType.normal,
                  polylines: {
                    Polyline(
                      polylineId: PolylineId("Route"),
                      points: contro.polylines,
                      color: Colors.blue,
                      width: 3,
                    )
                  },
                  initialCameraPosition: _kGooglePlex,
                  markers: Set<Marker>.of(pageC.myMarkers),
                  onMapCreated: (GoogleMapController controller) {
                    pageC.controller.complete(controller);
                    pageC.googleMapController = controller;
                  },
                  onTap: (argument) {
                    pageC.changeCamera(argument, 'My Location');
                  },
                );
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 35.h),
              child: Column(
                children: [
                  Container(
                    height: Get.height / 2,
                    child: SearchSection(),
                  ),
                  Spacer(),
                  Obx(
                    () {
                      return ElevatedButton(
                        onPressed: pageC.userLocation.value != null
                            ? () {
                                pageC.continueButton();
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(Get.width / 2, 50.h),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.sp)),
                          disabledBackgroundColor: Colors.grey,
                        ),
                        child: Text(
                          "Continue",
                          style: Get.textTheme.bodySmall!.copyWith(
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   // onPressed: _goToTheLake,
      //   label: const Text('To the lake!'),
      //   icon: const Icon(Icons.directions_boat),
      // ),
    );
  }
}
