import 'package:project_x/src/features/profile_feature/domain/repository/profile_repository.dart';

class UpdatePhotoUrlUseCase {
  final ProfileRepository _profileRepository;

  const UpdatePhotoUrlUseCase(this._profileRepository);

  Future<void> call() async {
    await _profileRepository.updatePhoto();
  }
}
