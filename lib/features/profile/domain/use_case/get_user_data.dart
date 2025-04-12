// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:injectable/injectable.dart';

import 'package:flowery/features/profile/domain/repos/profile_data_source_contract%20.dart';

@injectable
class GetUserData {
  final ProfileRemoteDataSourceContract profileDataSourceContract;
  GetUserData({required this.profileDataSourceContract});
  invoke() async {
    return await profileDataSourceContract.getLoggedInUserData();
  }
}
