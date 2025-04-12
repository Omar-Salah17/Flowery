import 'package:flowery/core/apiManger/apiService.dart';
import 'package:flowery/core/di/di.dart';
import 'package:flowery/features/profile/data/model/user_response.dart';
import 'package:flowery/features/profile/domain/repos/profile_data_source_contract%20.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProfileRemoteDataSourceContract)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSourceContract {
  final apiService = getIt<ApiService>();
  @override
  Future<UserData> getLoggedInUserData() async {
    var response = await apiService.getLoggedInUserData();
    if (response.message == "success") {
      return response.user!;
    } else {
      throw Exception("Failed to load user data");
    }
  }
}
