import 'package:flowery/features/profile/data/data_source/profile_remote_data_source.dart';
import 'package:flowery/features/profile/data/repos/profile_repo_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'profile_repo_impl_test.mocks.dart';

@GenerateMocks([ProfileRemoteDataSource])
void main() {
  
  group(' Test ProfileRepoImpl', () {
    late ProfileRepoImpl profileRepoImpl;
  late ProfileRemoteDataSource mockRemoteDataSource;
   setUpAll(() {
      mockRemoteDataSource = MockProfileRemoteDataSource();
      profileRepoImpl = ProfileRepoImpl(remoteDataSource: mockRemoteDataSource);
    });
    Map<String, dynamic> testData = { "password": "Sam@1234",
            "newPassword": "Sam@12345",};
     Map<String, dynamic> successResponse = {
    "message": "success"
  };
   
  });
  test('Should return right with response ', () async {});
}
