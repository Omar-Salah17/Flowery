import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/check_out/data/models/cash_order_response.dart';
import 'package:flowery/features/check_out/data/models/shipping_address_model.dart';
import 'package:flowery/features/check_out/domain/repos/check_out_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class CashCheckOutUseCase {
  final CheckOutRepo _checkOutRepo;
  CashCheckOutUseCase(this._checkOutRepo);
  Future<Either<Failure, CashOrderResponse>> call(
    ShippingAddressModel shippingAddressModel,
  ) async {
    return await _checkOutRepo.cashCheckOut(shippingAddressModel);
  }
}
