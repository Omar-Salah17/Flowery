import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:dio/dio.dart';
import '../../data/models/plus_code_client.dart';



class AutoLocationPicker extends StatefulWidget {
  const AutoLocationPicker({Key? key}) : super(key: key);

  @override
  _AutoLocationPickerState createState() => _AutoLocationPickerState();
}

class _AutoLocationPickerState extends State<AutoLocationPicker> {
  String plusCode = "Loading...";
  String areaName = "Loading...";
  bool isLoading = true;
  late PlusCodeClient _client;
  late Dio _dio;

  @override
  void initState() {
    super.initState();
    // Initialize Dio and Retrofit client
    _dio = Dio();
    _dio.options.connectTimeout = const Duration(seconds: 5);
    _dio.options.receiveTimeout = const Duration(seconds: 3);

    _client = PlusCodeClient(_dio);

    // Auto-fetch location
    _getLocationAutomatically();
  }

  @override
  void dispose() {
    _dio.close();
    super.dispose();
  }

  Future<void> _getLocationAutomatically() async {
    try {
      // Check if location services are enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        setState(() {
          plusCode = "Location services needed";
          areaName = "Please enable location";
          isLoading = false;
        });
        return;
      }

      // Check and request permissions automatically
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        // Auto-request permission
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          setState(() {
            plusCode = "Location access needed";
            areaName = "Please grant permission";
            isLoading = false;
          });
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        setState(() {
          plusCode = "Location permission denied";
          areaName = "Update in app settings";
          isLoading = false;
        });
        return;
      }

      // Get position automatically
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high
      );

      // Get location data in parallel
      await Future.wait([
        _getPlusCode(position.latitude, position.longitude),
        _getAreaName(position.latitude, position.longitude)
      ]);

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        plusCode = "Could not get location";
        areaName = "Please try again";
        isLoading = false;
      });
    }
  }

  Future<void> _getPlusCode(double latitude, double longitude) async {
    try {
      final coordinates = "$latitude,$longitude";
      final response = await _client.getPlusCode(coordinates);

      setState(() {
        // Prefer local code (shorter version) if available
        plusCode = response.plusCode.localCode ?? response.plusCode.globalCode;
      });
    } catch (e) {
      // Fallback: Create a simplified location code
      String simplifiedCode = "${latitude.toStringAsFixed(2)}°${longitude.toStringAsFixed(2)}°";
      setState(() {
        plusCode = simplifiedCode;
      });
    }
  }

  Future<void> _getAreaName(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        String locationName = '';

        // Choose the most specific location name available
        if (place.subLocality != null && place.subLocality!.isNotEmpty) {
          locationName = place.subLocality!;
        } else if (place.locality != null && place.locality!.isNotEmpty) {
          locationName = place.locality!;
        } else if (place.subAdministrativeArea != null && place.subAdministrativeArea!.isNotEmpty) {
          locationName = place.subAdministrativeArea!;
        } else if (place.administrativeArea != null && place.administrativeArea!.isNotEmpty) {
          locationName = place.administrativeArea!;
        }

        setState(() {
          areaName = locationName;
        });
      } else {
        setState(() {
          areaName = "Unknown area";
        });
      }
    } catch (e) {
      setState(() {
        areaName = "Unknown area";
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          const Icon(Icons.location_on, color: Colors.black54),
          const SizedBox(width: 8),
          Expanded(
            child: isLoading
                ? const Text("Detecting your location...",
                style: TextStyle(fontSize: 16))
                : Text(
              "Deliver to $plusCode - $areaName",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Icon(Icons.keyboard_arrow_down, color: Colors.pink),
        ],
      ),
    );
  }
}