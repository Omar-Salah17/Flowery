import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Directions {
  final LatLngBounds bounds;
  final List<PointLatLng> polylinePoints;
  final String totalDistance;
  final String totalDuration;

  Directions({
    required this.bounds,
    required this.polylinePoints,
    required this.totalDistance,
    required this.totalDuration,
  });

  factory Directions.fromMap(Map<String, dynamic> map) {
    final route = map['routes'][0];

    final bounds = LatLngBounds(
      northeast: LatLng(
        route['bounds']['northeast']['lat'],
        route['bounds']['northeast']['lng'],
      ),
      southwest: LatLng(
        route['bounds']['southwest']['lat'],
        route['bounds']['southwest']['lng'],
      ),
    );

    final leg = route['legs'][0];
    return Directions(
      bounds: bounds,
      polylinePoints: PolylinePoints().decodePolyline(
        route['overview_polyline']['points'],
      ),
      totalDistance: leg['distance']['text'],
      totalDuration: leg['duration']['text'],
    );
  }
}

class DirectionsRepository {
  final Dio _dio = Dio();
  final String _baseUrl =
      'https://maps.googleapis.com/maps/api/directions/json';

  Future<Directions?> fetchRoute({
    required LatLng origin,
    required LatLng destination,
  }) async {
    try {
      final response = await _dio.get(
        _baseUrl,
        queryParameters: {
          'origin': '${origin.latitude},${origin.longitude}',
          'destination': '${destination.latitude},${destination.longitude}',
          'key': 'AIzaSyC-i04d3aeW-Cx-7K9krM2FHqDJSScWQHo',
        },
      );

      if (response.statusCode == 200 && response.data['routes'].isNotEmpty) {
        return Directions.fromMap(response.data);
      }
    } catch (e) {
      debugPrint('Failed to fetch directions: $e');
    }

    return null;
  }
}
