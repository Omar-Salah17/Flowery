import 'package:flowery/core/apiManger/apiService.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/profile/data/data_source/profile_remote_data_source.dart';
import 'package:flowery/features/profile/data/data_source/profile_remote_data_source_impl.dart';
import 'package:flowery/features/profile/data/model/user_response.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'profile_remote_data_source_impl_test.mocks.dart';

@GenerateMocks([ApiService])
void main() {
  group('Test ProfileRemoteDataSource', () {
    late ApiService apiService;

    late ProfileRemoteDataSource profileRemoteDataSourceContract;
    setUp(() {
      // Initialize the mock API service
      apiService = MockApiService();
      profileRemoteDataSourceContract = ProfileRemoteDataSourceImpl(
        apiService: apiService,
      );
    });
    test(
      'getLoggedInUserData should return UserData when API call is successful',
      () async {
        final mockResponse = UserData();
        when(apiService.getLoggedInUserData()).thenAnswer(
          (_) async => UserResponse(message: "success", user: mockResponse),
        );
        final result =
            await profileRemoteDataSourceContract.getLoggedInUserData();
        verify(apiService.getLoggedInUserData()).called(1);
        expect(result, mockResponse);
      },
    );
      test('getLoggedInUserData should return Failure when API call fails', (){
    final mockError = ServerFailure(errorMessage: "error");
    when(apiService.getLoggedInUserData()).thenThrow(mockError);
    
      final result = profileRemoteDataSourceContract.getLoggedInUserData();
    verify(apiService.getLoggedInUserData()).called(1);
    
    expect(result, throwsA(isA<ServerFailure>()));
  });
  
  });
}
