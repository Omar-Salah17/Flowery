// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:injectable/injectable.dart';

import 'package:flowery/features/occasion/domain/repos/occasion_repository_contract.dart';

import '../../data/models/occaions.dart';

@injectable
class GetAllOccasionsUseCase {
  OccasionRepositoryContract occasionRepositoryContract;
  GetAllOccasionsUseCase({required this.occasionRepositoryContract});
  Future<Either<Failure, List<Occasions>>> invoke() async {
    return await occasionRepositoryContract.getAllOccasions();
  }
}
