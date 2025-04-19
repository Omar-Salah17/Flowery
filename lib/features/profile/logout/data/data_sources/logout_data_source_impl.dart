import 'package:injectable/injectable.dart';
import '../../../../../core/api_manger/api_service.dart';
import '../../../../../core/di/di.dart';
import 'logout_data_source.dart';

@Injectable(as: LogoutDataSource)
class LogoutDataSourceImpl implements LogoutDataSource {
  final apiService = getIt<ApiService>();

  @override
  Future<String> logout() async {
    var response = await apiService.logout();
    return response;
  }
}
