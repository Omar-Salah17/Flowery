import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/auth/forgetPassword/domain/repos/forget_password_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class VerifyCodeUseCase {
  final ForgetPasswordRepo forgetPasswordRepo;

  VerifyCodeUseCase({required this.forgetPasswordRepo});
  Future<Either<Failure, Map<String, dynamic>>> call({required String resetCode}) async {
    return await forgetPasswordRepo.verifyCode(resetCode: resetCode);
  }
}
