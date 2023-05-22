import 'dart:async';

import 'package:carpooling_o6u_students/app/core/widgets/custom_text.dart';
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
    drawPoly();
  }

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  List<LatLng> polylines = [];

  void drawPoly() async {
    PolylinePoints polylinePoints = PolylinePoints();
    var result = await polylinePoints.getRouteBetweenCoordinates(
      'AIzaSyCB3yITDurDAeXU9rrqLR-0ohYdvXQ1mj8',
      PointLatLng(30.035907431824228, 30.995309353298367),
      PointLatLng(29.976628616030585, 30.94735501664918),
    );
    // result.points.
    if (result.points.isNotEmpty) {
      print("objects");
      result.points.forEach((p) {
        polylines.add(
          LatLng(p.latitude, p.longitude),
        );
      });
      setState(() {});
    }
    print("${result.points.length.toString()}+asas");
    print(result.errorMessage);
  }

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
                      points: polylines,
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
                      Flexible(
                        child: TextField(
                          style: TextStyle(
                            color: Get.theme.primaryColor,
                          ),
                          decoration: InputDecoration(
                            filled: true,
                            hintText: "Search",
                            prefixIcon: Icon(Icons.search),
                            suffixIcon: IconButton(
                              onPressed: () {
                                pageC.search();
                              },
                              icon: Icon(Icons.search),
                            ),
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.sp),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.sp),
                              borderSide:
                                  BorderSide(color: Get.theme.primaryColor),
                            ),
                          ),
                        ),
                      ),
                    ],
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
