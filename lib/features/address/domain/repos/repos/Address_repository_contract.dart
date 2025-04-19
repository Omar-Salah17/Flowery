import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/address/data/models/logged_user_address_model.dart';

abstract class AddressRepositoryContract {
Future<Either<Failure, List<Addresses>?>> getLoggedUserAddress();
}