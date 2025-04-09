import 'package:flowery/features/home/data/models/best-seller_response.dart';

abstract class Homebestsellersdatasource {
  Future<BestSellerResponse> fetchHomeBestSellers();
}
