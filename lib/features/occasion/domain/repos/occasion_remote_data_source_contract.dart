import 'package:flowery/core/utils/models/products_model/products_model.dart';
import 'package:flowery/features/occasion/data/models/occaions.dart';

abstract class OccasionRemoteDataSourceContract {
  Future<List<Occasions>> getAllOccasions();
  Future<ProductsModel> getProductsByOccasion({String? occasionId});
}
