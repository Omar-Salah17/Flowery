import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/home/data/models/product_response_model.dart';
import 'package:flowery/features/home/domain/repository/product_remote_data_source.dart';
import 'package:flowery/features/home/domain/repository/product_repository.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: ProductRepositoryContract)
class ProductRepositoryImpl implements ProductRepositoryContract {
  final ProductRemoteDataSource productRemoteDataSource;

  ProductRepositoryImpl({required this.productRemoteDataSource});
  @override
  Future<Either<Failure, List<Products>>> getAllProductByOccasion({required String occasionId}) async {
  var response = await  productRemoteDataSource.getAllProductByOccasion(occasionId: occasionId);
    try {
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}