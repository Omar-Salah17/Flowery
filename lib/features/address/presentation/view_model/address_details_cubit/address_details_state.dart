part of 'address_details_cubit.dart';

sealed class AddressDetailsState extends Equatable {
  const AddressDetailsState();

  @override
  List<Object> get props => [];
}

final class AddressDetailsInitial extends AddressDetailsState {}

final class AddressDetailsLoading extends AddressDetailsState {}

final class AddressDetailsSuccess extends AddressDetailsState {
  final AddAddressResponse addAddressResponse;

 const AddressDetailsSuccess({required this.addAddressResponse});
}

final class AddressDetailsError extends AddressDetailsState {
  final String errorMessage;

 const AddressDetailsError({required this.errorMessage});
}
final class AddressDetailsLocationUpdated extends AddressDetailsState{}