abstract class ForgetPasswordRemoteDataSource {
  Future<Map<String, dynamic>> forgetPassword({required String email});
  Future<Map<String, dynamic>> verfiyCode({required String resetCode});
}
