import 'package:flowery/features/best_seller/data/models/best_seller_model.dart';

abstract class BestSellerDataSource {
  Future<BestSellerModel> getBestSellerProduct();
}