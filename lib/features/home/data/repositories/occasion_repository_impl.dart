import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/home/data/models/occaions.dart';
import 'package:flowery/features/home/domain/repository/occasion_remote_data_source_contract.dart';
import 'package:flowery/features/home/domain/repository/occasion_repository_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: OccasionRepositoryContract)
class OccasionRepositoryImpl implements OccasionRepositoryContract {
  final OccasionRemoteDataSourceContract occasionRemoteDataSourceContract;
  OccasionRepositoryImpl({required this.occasionRemoteDataSourceContract});
  @override
  Future<Either<Failure, List<Occasions>>> getAllOccasions() async {
    var response = await occasionRemoteDataSourceContract.getAllOccasions();
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
