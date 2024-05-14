import 'package:project_x/src/features/profile_feature/domain/repository/profile_repository.dart';

class DeleteAccountUseCase {
  final ProfileRepository _profileRepository;

  const DeleteAccountUseCase(this._profileRepository);

  Future<void> call() async {
    await _profileRepository.deleteAccount();
  }
}
