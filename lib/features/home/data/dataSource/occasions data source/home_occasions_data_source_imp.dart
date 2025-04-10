import 'package:flowery/core/apiManger/apiService.dart';
import 'package:flowery/features/home/data/dataSource/occasions%20data%20source/home_occasions_data_source.dart';
import 'package:flowery/features/home/data/models/occasions_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeOccasionsDataSource)
class HomeOccasionsDataSourceImp implements HomeOccasionsDataSource {
  final ApiService apiService;
  HomeOccasionsDataSourceImp({required this.apiService});
  @override
  Future<OcaasionsResponse> getHomeOccasions() async {
    var response = await apiService.getHomeOccasions();
    return response;
  }
}
