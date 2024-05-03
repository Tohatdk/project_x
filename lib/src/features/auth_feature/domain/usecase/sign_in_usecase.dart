import 'package:either_dart/either.dart';
import 'package:project_x/core/network/error.dart';
import 'package:project_x/src/features/auth_feature/domain/entities/account_entity.dart';
import 'package:project_x/src/features/auth_feature/domain/repository/account_repository.dart';

class SignInUseCase {
  final AccountRepository _accountRepository;

  const SignInUseCase(this._accountRepository);

  Future<Either<AppError, AccountEntity?>> execute({
    required String email,
    required String password,
  }) async {
    try {
      final account = await _accountRepository.signIn(
        email: email,
        password: password,
      );
      return Right(account);
    } on AppError catch (error) {
      return Left(error);
    }
  }
}
