import 'package:dartz/dartz.dart';
import 'package:flowery/features/best_seller/domain/repos/best_seller_repo.dart';
import 'package:flowery/features/categories/data/models/products_model/product.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/error_handler.dart';
import '../../data/models/best_seller_model.dart';

@injectable
class GetBestSellerUseCase {
  final BestSellerRepo bestSellerRepo;

  GetBestSellerUseCase({required this.bestSellerRepo});

  Future<Either<Failure, BestSellerModel>> call() async {
    return await bestSellerRepo.getBestSeller();
  }
}
