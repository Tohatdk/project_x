import 'package:project_x/src/features/profile_feature/domain/repository/profile_repository.dart';

class UpdateEmailUseCase {
  final ProfileRepository _profileRepository;

  const UpdateEmailUseCase(this._profileRepository);

  Future<void> call() async {
    await _profileRepository.updateEmail();
  }
}
