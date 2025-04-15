// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flowery/core/utils/error_handler.dart';
import 'package:injectable/injectable.dart';

import 'package:flowery/core/apiManger/apiService.dart';
import 'package:flowery/features/profile/data/model/user_response.dart';
import 'package:flowery/features/profile/domain/repos/profile_data_source_contract%20.dart';

@Injectable(as: ProfileRemoteDataSourceContract)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSourceContract {
  ApiService apiService;
  ProfileRemoteDataSourceImpl({
    required this.apiService,
  });
  @override
  Future<UserData> getLoggedInUserData() async {
    var response = await apiService.getLoggedInUserData();
    if (response.message == "success") {
      return response.user!;
    } else {
      throw ServerFailure(errorMessage: response.message!);
    }
  }
}
