import 'package:flowery/features/occasion/data/models/occasions_response.dart';

abstract class HomeOccasionsDataSource {
  Future<OcaasionsResponse> getHomeOccasions();
}
