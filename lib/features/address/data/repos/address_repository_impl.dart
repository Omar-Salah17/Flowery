
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/address/data/data_source/address_remote_data_source_impl.dart';

import 'package:flowery/features/address/data/models/add_address_response/add_address_response.dart';

import 'package:flowery/features/address/data/models/logged_user_address_model.dart';

import 'package:flowery/features/address/data/models/user_address_data.dart';

import '../../domain/repos/address_repository_contract.dart';

class AddressRepositoryImpl implements AddressRepositoryContract{

  final AddressRemoteDataSource addressRemoteDataSource;

  AddressRepositoryImpl({required this.addressRemoteDataSource});
  @override
  Future<Either<Failure, AddAddressResponse>> addAddress(UserAddressData address) async{
     try {
  final data = await addressRemoteDataSource.addNewAddress(address);
  return right(data);
}  catch (e) {
   if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        log(
          'error in AddressRepositoryImpl addAddress method: ${e.toString()}',
        );
        return left(ServerFailure(errorMessage: e.toString()));
      }
}
  }

  @override
  Future<Either<Failure, List<Addresses>?>> getLoggedUserAddress()async {
    try {
      var response = await addressRemoteDataSource.getLoggedUserAddress();
      return right(response);
    } catch (e) {
      if (e is ServerFailure) {
        return left(e);
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}