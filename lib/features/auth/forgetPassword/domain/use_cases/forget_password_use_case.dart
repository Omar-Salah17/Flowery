import 'package:dartz/dartz.dart';
import 'package:flowery/core/utils/error_handler.dart';
import 'package:flowery/features/auth/forgetPassword/domain/repos/forget_password_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForgetPasswordUseCase {
  final ForgetPasswordRepo forgetPasswordRepo;

  ForgetPasswordUseCase({required this.forgetPasswordRepo});
  Future<Either<Failure, Map<String, dynamic>>> call({required String email}) async {
    return await forgetPasswordRepo.forgetPassword(email: email);
  }
}
