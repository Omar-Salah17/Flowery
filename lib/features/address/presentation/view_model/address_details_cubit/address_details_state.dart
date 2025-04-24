part of 'address_details_cubit.dart';

sealed class AddressDetailsState extends Equatable {
  const AddressDetailsState();

  @override
  List<Object> get props => [];
}

final class AddressDetailsInitial extends AddressDetailsState {}

final class AddAddressLoading extends AddressDetailsState {}

final class AddAddressSucces extends AddressDetailsState {
  final AddAddressResponse addAddressResponse;

  const AddAddressSucces({required this.addAddressResponse});
}

final class AddAddressFailure extends AddressDetailsState {
  final String errorMessage;

  const AddAddressFailure({required this.errorMessage});
}

final class AddressDetailsLocationUpdated extends AddressDetailsState {
  final String? city, area;

  const AddressDetailsLocationUpdated({this.city, this.area});
}
