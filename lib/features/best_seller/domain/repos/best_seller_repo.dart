import 'package:dartz/dartz.dart';
import 'package:flowery/features/best_seller/data/models/best_seller_model.dart';

import '../../../../core/utils/error_handler.dart';
import '../../../categories/data/models/products_model/product.dart';

abstract class BestSellerRepo {
  Future<Either<Failure, BestSellerModel>> getBestSeller();
}
