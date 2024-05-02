import 'package:project_x/src/features/auth_feature/domain/repository/account_repository.dart';

class LogoutUseCase {
  final AccountRepository _accountRepository;

  const LogoutUseCase(this._accountRepository);

  Future<void> signOut() async {
    await _accountRepository.signOut();
  }
}
