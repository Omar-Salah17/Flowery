import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/best_seller/data/models/best_seller_model.dart';

abstract class BestSellerRepo {
  Future<Either<Failure, BestSellerModel>> getBestSeller();
}
