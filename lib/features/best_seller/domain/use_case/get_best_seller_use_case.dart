import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/best_seller/data/models/best_seller_model.dart';
import 'package:flowery/features/best_seller/domain/repos/best_seller_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetBestSellerUseCase {
  final BestSellerRepo bestSellerRepo;

  GetBestSellerUseCase({required this.bestSellerRepo});

  Future<Either<Failure, BestSellerModel>> call() async {
    return await bestSellerRepo.getBestSeller();
  }
}
