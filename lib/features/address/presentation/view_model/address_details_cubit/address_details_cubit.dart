import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flowery/features/address/data/models/add_address_response/add_address_response.dart';
import 'package:flowery/features/address/data/models/user_address_data.dart';
import 'package:flowery/features/address/domain/use_case/add_address_use_case.dart';

part 'address_details_state.dart';

class AddressDetailsCubit extends Cubit<AddressDetailsState> {
  AddressDetailsCubit(this.addAddressUseCase) : super(AddressDetailsInitial());
  final AddAddressUseCase addAddressUseCase;

  Future<void> addAddress(UserAddressData addressData) async {
    emit(AddressDetailsLoading());
    final result = await addAddressUseCase.call(addressData);
    result.fold((faliure) {
      emit(AddressDetailsError(errorMessage: faliure.errorMessage));
    }, (address) {
      emit(AddressDetailsSuccess( addAddressResponse: address));
    });
  }
}
