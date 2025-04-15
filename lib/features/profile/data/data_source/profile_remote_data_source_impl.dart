import 'package:flowery/core/apiManger/api_manager.dart';
import 'package:flowery/core/utils/constants.dart';
import 'package:flowery/features/profile/data/data_source/profile_remote_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final ApiManager apiManager;

  ProfileRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<Map<String, dynamic>> changePassword(Map<String, dynamic> data)async {
 var response = await apiManager.patchRequest(Constants.changePasswordEndPoint, data);
 return response.data;
  }
}
