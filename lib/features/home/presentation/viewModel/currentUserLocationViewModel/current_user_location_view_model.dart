import 'package:flowery/features/home/data/models/plus_code_client.dart';
import 'package:flowery/features/home/presentation/viewModel/currentUserLocationViewModel/location_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class CurrentUserLocationViewModel extends Cubit<LocationState> {
  final PlusCodeClient _client;

  CurrentUserLocationViewModel(this._client) : super(LocationInitial());

  Future<void> fetchLocation() async {
    emit(LocationLoading());

    try {
      final bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        emit(LocationError("Location services needed"));
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          emit(LocationError("Location access denied"));
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        emit(
          LocationError(
            "Permission permanently denied , please enable it from the device Settings.",
          ),
        );
        return;
      }

      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      final plusCode = await _getPlusCode(
        position.latitude,
        position.longitude,
      );
      final areaName = await _getAreaName(
        position.latitude,
        position.longitude,
      );

      emit(LocationSuccess(plusCode: plusCode, areaName: areaName));
    } catch (_) {
      emit(LocationError("Couldn't fetch location"));
    }
  }

  Future<String> _getPlusCode(double latitude, double longitude) async {
    try {
      final res = await _client.getPlusCode("$latitude,$longitude");
      return res.plusCode.localCode ?? res.plusCode.globalCode;
    } catch (_) {
      return "${latitude.toStringAsFixed(2)}°${longitude.toStringAsFixed(2)}°";
    }
  }

  Future<String> _getAreaName(double latitude, double longitude) async {
    try {
      final placeMarks = await placemarkFromCoordinates(latitude, longitude);
      final place = placeMarks.first;

      return place.subLocality?.isNotEmpty == true
          ? place.subLocality!
          : place.locality?.isNotEmpty == true
          ? place.locality!
          : place.subAdministrativeArea?.isNotEmpty == true
          ? place.subAdministrativeArea!
          : place.administrativeArea ?? "Unknown area";
    } catch (_) {
      return "Unknown area";
    }
  }
}
