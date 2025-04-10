import 'package:flowery/features/home/data/models/occasions_response.dart';

abstract class HomeOccasionsDataSource {
  Future<OcaasionsResponse> getHomeOccasions();
}
