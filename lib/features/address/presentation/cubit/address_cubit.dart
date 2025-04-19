import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flowery/core/di/di.dart';
import 'package:flowery/features/address/data/models/logged_user_address_model.dart';
import 'package:flowery/features/address/domain/repos/repos/Address_repository_contract.dart';
import 'package:flowery/features/address/domain/use_case/get_logged_user_address_use_case.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit() : super(AddressInitial());
  GetLoggedUserAddressUseCase getLoggedUserAddressUseCase =
      GetLoggedUserAddressUseCase(getIt<AddressRepositoryContract>());
  Future<void> getLoggedUserAddress() async {
    emit(AddressLoading());
    final result = await getLoggedUserAddressUseCase.invoke();
    result.fold(
      (failure) {
        emit(AddressError(failure.errorMessage));
      },
      (addressList) {
        emit(AddressSuccess(addressList: addressList));
      },
    );
  }
}
