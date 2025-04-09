import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/home/data/models/best-seller_response.dart';
import 'package:flowery/features/home/domain/repos/bestSellerRepo.dart';
import 'package:injectable/injectable.dart';

@injectable
class Bestsellerusecase {
  final BestSellerRepo bestSellerRepo;
  Bestsellerusecase({required this.bestSellerRepo});

  Future<Either<Failure, List<BestSeller>>> invoke() async {
    return await bestSellerRepo.getBestSellers();
  }
}
