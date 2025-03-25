import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/auth/forgetPassword/domain/repos/forget_password_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetPasswordUseCase {
  final ForgetPasswordRepo forgetPasswordRepo;

  ResetPasswordUseCase({required this.forgetPasswordRepo});

  Future<Either<Failure, Map<String, dynamic>>> call({
    required String email,
    required String newPassword,
  }) async {
 return await  forgetPasswordRepo.resetPassword(email: email, newPassword: newPassword);
  }
}
