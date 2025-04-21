import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/check_out/data/models/check_out_session_response.dart';
import 'package:flowery/features/check_out/data/models/shipping_address_model.dart';
import 'package:flowery/features/check_out/domain/repos/check_out_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class CreditCheckOutUseCase {
  final CheckOutRepo _checkOutRepo;
  CreditCheckOutUseCase(this._checkOutRepo);
  Future<Either<Failure, CheckoutSessionResponse>> call(
    ShippingAddressModel shippingAddressModel,
  ) async {
    return await _checkOutRepo.creditCheckOut(shippingAddressModel);
  }
}
