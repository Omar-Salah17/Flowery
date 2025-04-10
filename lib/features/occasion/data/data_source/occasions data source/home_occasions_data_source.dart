
import '../../models/occasions_response.dart';

abstract class HomeOccasionsDataSource {
  Future<OcaasionsResponse> getHomeOccasions();
}
