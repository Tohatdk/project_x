import 'package:project_x/core/network/error.dart';

import 'package:project_x/src/features/auth_feature/domain/repository/account_repository.dart';
import 'package:either_dart/either.dart';

class SendResetPasswordRequestUseCase {
  final AccountRepository _accountRepository;

  const SendResetPasswordRequestUseCase(this._accountRepository);

  Future<Either<AppError, void>> call({
    required String email,
  }) async {
    try {
      await _accountRepository.sendResetPassword(
       email: email,
      );
      return const Right(null);
    } on AppError catch (error) {
      return Left(error);
    }
  }
}
