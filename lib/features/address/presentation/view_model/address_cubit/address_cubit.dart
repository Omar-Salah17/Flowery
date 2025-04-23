import 'package:equatable/equatable.dart';
import 'package:flowery/core/di/di.dart';
import 'package:flowery/features/address/data/models/address_model.dart';
import 'package:flowery/features/address/data/models/logged_user_address_model.dart';
<<<<<<< HEAD:lib/features/address/presentation/cubit/address_cubit.dart
import 'package:flowery/features/address/domain/repos/repos/Address_repository_contract.dart';
import 'package:flowery/features/address/domain/use_case/delete_address_use_case.dart';
=======
import 'package:flowery/features/address/domain/repos/address_repo.dart';

>>>>>>> origin/feature/address:lib/features/address/presentation/view_model/address_cubit/address_cubit.dart
import 'package:flowery/features/address/domain/use_case/get_logged_user_address_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit() : super(AddressInitial());
  GetLoggedUserAddressUseCase getLoggedUserAddressUseCase =
<<<<<<< HEAD:lib/features/address/presentation/cubit/address_cubit.dart
      GetLoggedUserAddressUseCase(getIt<AddressRepositoryContract>());
      DeleteAddressUseCase deleteAddressUseCase = DeleteAddressUseCase(getIt<AddressRepositoryContract>());
    static AddressCubit get(BuildContext context) => BlocProvider.of(context);
=======
      GetLoggedUserAddressUseCase(getIt<AddressRepo>());
>>>>>>> origin/feature/address:lib/features/address/presentation/view_model/address_cubit/address_cubit.dart
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
  Future<void> fetchListAfterDelete() async {
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
  Future<void> deleteAddress({required String addressId}) async {
    // emit(AddressLoading());
    final result = await deleteAddressUseCase.invoke(addressId);
    result.fold(
      (failure) {
        emit(AddressError(failure.errorMessage));
      },
      (response) {
        emit(AddressDeleteSuccess( addressList: response,));
        fetchListAfterDelete();
      },
    );
  }

}
