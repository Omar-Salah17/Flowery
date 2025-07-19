import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flowery/core/utils/app_text_styles.dart';
import 'package:flowery/core/utils/colors.dart';
import 'package:flowery/core/utils/services/directions_service.dart';
import 'package:flowery/features/my_orders/presentation/view/driver_firebase_service%20.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapTracking extends StatefulWidget {
  const MapTracking({super.key});

  @override
  State<MapTracking> createState() => _MapTrackingState();
}

class _MapTrackingState extends State<MapTracking> {
  final CameraPosition _initialPosition = const CameraPosition(
    target: LatLng(30, 31),
    zoom: 11,
  );

  late GoogleMapController _mapController;
  LatLng customerLocation = const LatLng(
    30.0032182,
    31.1890892,
  ); // 7adayek October
  LatLng? driverLocation;

  static const String driverId = "driverId123";

  Set<Marker> markers = {};
  Set<Polyline> polylines = {};
  Directions? info;

  Marker? movingDriverMarker;

  BitmapDescriptor customIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor driverCustomIcon = BitmapDescriptor.defaultMarker;
  void createMarker() {
    BitmapDescriptor.asset(
      ImageConfiguration(),
      'assets/images/Vector.png',
      height: 25.h,
      width: 25.w,
    ).then((icon) {
      setState(() {
        customIcon = icon;
      });
    });
  }

  void createDriverMarker() {
    BitmapDescriptor.asset(
      ImageConfiguration(),
      'assets/images/compressed_motorcycle (1).png',
      height: 25.h,
      width: 25.w,
    ).then((icon) {
      setState(() {
        driverCustomIcon = icon;
      });
    });
  }

  @override
  void initState() {
    createMarker();
    super.initState();
    listenToDriverLocation();
  }

  void listenToDriverLocation() {
    DriverFirebaseService.firestore
        .collection('drivers')
        .doc(driverId)
        .snapshots()
        .listen((docSnapshot) async {
          if (!docSnapshot.exists) return;

          final data = docSnapshot.data();
          final location = data?['location'];
          if (location == null) return;

          final double lat = location['latitude'];
          final double lng = location['longitude'];
          final currentLocation = LatLng(lat, lng);

          if (driverLocation == null) {
            // First time: assign driver start location
            driverLocation = currentLocation;

            // Fetch directions once
            info = await DirectionsRepository().fetchRoute(
              origin: driverLocation!,
              destination: customerLocation,
            );
            log('$info');

            // Set fixed markers + route
            setState(() {
              markers = {
                Marker(
                  markerId: const MarkerId('driver_start'),
                  position: driverLocation!,
                  icon: customIcon,
                ),
                Marker(
                  markerId: const MarkerId('customer'),
                  position: customerLocation,
                  icon: customIcon,
                ),
              };

              polylines = {
                if (info != null)
                  Polyline(
                    polylineId: const PolylineId('route'),
                    color: Colors.blue,
                    width: 5,
                    points:
                        info!.polylinePoints!
                            .map((e) => LatLng(e.latitude, e.longitude))
                            .toList(),
                  ),
              };

              // Initial moving marker
              movingDriverMarker = Marker(
                markerId: const MarkerId('moving_driver'),
                position: currentLocation,
                icon: driverCustomIcon,
              );
              markers.add(movingDriverMarker!);
            });
          } else {
            // Just update the moving marker
            setState(() {
              movingDriverMarker = Marker(
                markerId: const MarkerId('moving_driver'),
                position: currentLocation,
                icon: driverCustomIcon,
              );

              // Update marker in the set
              markers.removeWhere((m) => m.markerId.value == 'moving_driver');
              markers.add(movingDriverMarker!);
            });
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: _initialPosition,
            onMapCreated: (controller) {
              _mapController = controller;
            },
            markers: markers,
            polylines: polylines,
            myLocationEnabled: true,
            zoomControlsEnabled: false,
          ),
          _buildBottomSheet(context),
        ],
      ),
    );
  }

  Widget _buildBottomSheet(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        padding: const EdgeInsets.all(16),
        height: MediaQuery.of(context).size.height * 0.35,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Estimated arrival',
              style: AppTextStyles.instance.textStyle14.copyWith(
                color: const Color(0xFF535353),
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '03 Sep 2024, 11:00 AM',
              style: AppTextStyles.instance.textStyle16.copyWith(
                color: const Color(0xFF0C1015),
              ),
            ),
            SizedBox(height: 16.h),
            const Divider(color: Colors.grey, thickness: 1),
            SizedBox(height: 24.h),
            Row(
              children: [
                Image.asset("assets/images/Delivery Boy.png"),
                SizedBox(width: 20.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Muhamed',
                        style: AppTextStyles.instance.textStyle14.copyWith(
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Is your delivery hero for today',
                        style: AppTextStyles.instance.textStyle12.copyWith(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Image.asset("assets/images/call.png"),
                    SizedBox(width: 12.w),
                    Image.asset("assets/images/whatsapp.png"),
                  ],
                ),
              ],
            ),
            SizedBox(height: 40.h),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: PalletsColors.mainColorBase,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {},
                child: const Text(
                  'Order details',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
