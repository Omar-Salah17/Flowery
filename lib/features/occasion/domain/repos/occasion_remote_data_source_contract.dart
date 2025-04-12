

import '../../../../core/utils/models/products_model/products_model.dart';
import '../../data/models/occaions.dart';

abstract class OccasionRemoteDataSourceContract {
  Future< List<Occasions>> getAllOccasions();
  Future<ProductsModel> getProductsByOccasion({String? occasionId});
}