part of 'address_cubit.dart';

sealed class AddressState extends Equatable {
  const AddressState();

  @override
  List<Object> get props => [];
}

final class AddressInitial extends AddressState {}
final class AddressLoading extends AddressState {}
final class AddressSuccess extends AddressState {
  final List<Addresses> ? addressList;
  const AddressSuccess({this.addressList});
  @override
  List<Object> get props => [addressList?? []];
}
final class AddressError extends AddressState {
  final String errorMessage;
  const AddressError(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
final class AddressDeleteSuccess extends AddressState {

final  List<Address>? addressList;
  const AddressDeleteSuccess({this.addressList});
  @override
  List<Object> get props => [addressList??[]];
}
