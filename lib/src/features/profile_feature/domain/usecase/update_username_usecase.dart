import 'package:project_x/src/features/profile_feature/domain/repository/profile_repository.dart';

class UpdateUsernameUseCase {
  final ProfileRepository _profileRepository;

  const UpdateUsernameUseCase(this._profileRepository);

  Future<void> call() async {
    await _profileRepository.updateUsername();
  }
}
