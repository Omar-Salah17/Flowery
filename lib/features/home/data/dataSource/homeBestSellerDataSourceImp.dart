import 'package:flowery/core/apiManger/apiService.dart';
import 'package:flowery/features/home/data/dataSource/homeBestSellersDataSource.dart';
import 'package:flowery/features/home/data/models/best-seller_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: Homebestsellersdatasource)
class Homebestsellerdatasourceimp implements Homebestsellersdatasource {
  final ApiService apiService;
  Homebestsellerdatasourceimp({required this.apiService});
  @override
  Future<BestSellerResponse> fetchHomeBestSellers() async {
    var response = await apiService.getBestSellers();
    return response;
  }
}
