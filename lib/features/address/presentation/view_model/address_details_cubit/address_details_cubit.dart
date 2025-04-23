import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flowery/features/address/data/models/add_address_response/add_address_response.dart';
import 'package:flowery/features/address/data/models/logged_user_address_model.dart';
import 'package:flowery/features/address/data/models/user_address_data.dart';
import 'package:flowery/features/address/domain/use_case/add_address_use_case.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'address_details_state.dart';

class AddressDetailsCubit extends Cubit<AddressDetailsState> {
  AddressDetailsCubit(this.addAddressUseCase, this.addressModel)
    : super(AddressDetailsInitial());
  Addresses? addressModel;

  final AddAddressUseCase addAddressUseCase;

  late final TextEditingController address;
  late final TextEditingController phoneNumber;
  late final TextEditingController recipientNameController;

  double? lat;
  double? long;
  GoogleMapController? mapController;
  Set<Marker> markers = {};
  void initControllers() {
    address = TextEditingController(text: addressModel?.street?? "");
    phoneNumber = TextEditingController(text: addressModel?.phone?? "");
    recipientNameController = TextEditingController(text: addressModel?.username?? "");
  }

  Future<void> addAddress(UserAddressData addressData) async {
    emit(AddressDetailsLoading());
    final result = await addAddressUseCase.call(addressData);
    result.fold(
      (failure) =>
          emit(AddressDetailsError(errorMessage: failure.errorMessage)),
      (address) => emit(AddressDetailsSuccess(addAddressResponse: address)),
    );
  }

  Future<void> updateMapFromAddress(String fullAddress) async {
    try {
      final locations = await locationFromAddress(fullAddress);
      if (locations.isNotEmpty) {
        final loc = locations.first;
        lat = loc.latitude;
        long = loc.longitude;

        markers = {
          Marker(markerId: const MarkerId("1"), position: LatLng(lat!, long!)),
        };

        mapController?.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(target: LatLng(lat!, long!), zoom: 15),
          ),
        );

        emit(AddressDetailsLocationUpdated());
      }
    } catch (e) {
      log("Geocoding failed: $e");
      emit(AddressDetailsError(errorMessage: "Invalid address input"));
    }
  }

  Future<void> updateAddressFromMap(LatLng position) async {
    try {
      final placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        final placemark = placemarks.first;
        address.text = [
          placemark.street,
          placemark.subLocality,
          placemark.locality,
        ].where((part) => part != null && part.isNotEmpty).join(', ');

        emit(AddressDetailsLocationUpdated());
      }
    } catch (e) {
      log("Error updating from LatLng: $e");
      emit(AddressDetailsError(errorMessage: "Failed to get location info"));
    }
  }

  @override
  Future<void> close() {
    address.dispose();
    phoneNumber.dispose();
    recipientNameController.dispose();
    return super.close();
  }
}
