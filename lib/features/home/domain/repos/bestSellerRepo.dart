import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/home/data/models/best-seller_response.dart';

abstract class BestSellerRepo {
  Future<Either<Failure, List<BestSeller>>> getBestSellers();
}
