import 'package:flowery/features/home/data/models/product_response_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<Products>> getAllProductByOccasion({required String occasionId});
}