import 'package:flowery/core/api_manger/api_service.dart';
import 'package:flowery/features/best_seller/data/data_source/best_seller_data_source.dart';
import 'package:flowery/features/best_seller/data/models/best_seller_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BestSellerDataSource)
class BestSellerDataSourceImpl implements BestSellerDataSource {
  final ApiService apiService;
  BestSellerDataSourceImpl(this.apiService);
  @override
  Future<BestSellerModel> getBestSellerProduct() async {
    final response = await apiService.getBestSellerProduct();
    return response;
  }
}
