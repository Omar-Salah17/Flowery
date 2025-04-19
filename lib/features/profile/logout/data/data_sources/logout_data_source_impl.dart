import 'package:flowery/core/api_manger/api_service.dart';
import 'package:flowery/core/di/di.dart';
import 'package:flowery/features/profile/logout/data/data_sources/logout_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LogoutDataSource)
class LogoutDataSourceImpl implements LogoutDataSource {
  final apiService = getIt<ApiService>();

  @override
  Future<String> logout() async {
    final response = await apiService.logout();
    return response;
  }
}
