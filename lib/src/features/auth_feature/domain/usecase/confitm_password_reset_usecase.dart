import 'package:either_dart/either.dart';
import 'package:project_x/core/network/error.dart';
import 'package:project_x/src/features/auth_feature/domain/repository/account_repository.dart';

class ConfirmPasswordUseCase {
  final AccountRepository _accountRepository;

  const ConfirmPasswordUseCase(this._accountRepository);

  Future<Either<AppError, void>> call({
    required String newPassword,required String code,
  }) async {
    try {
      await _accountRepository.confirmPassword(
    newPassword:newPassword,code: code,);
      return const Right(null);
    } on AppError catch (error) {
      return Left(error);
    }
  }
}
