import 'package:flowery/core/apiManger/apiService.dart';
import 'package:flowery/core/di/di.dart';
import 'package:flowery/features/auth/login/data/models/login_respose.dart';
import 'package:flowery/features/profile/domain/repos/profile_data_source_contract%20.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProfileRemoteDataSourceContract)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSourceContract {
  final apiService = getIt<ApiService>();
  @override
  Future<User> getLoggedInUserData() async {
    var response = await apiService.getLoggedInUserData();
    return response;
  }
}
