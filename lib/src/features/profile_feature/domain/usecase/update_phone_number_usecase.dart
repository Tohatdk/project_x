import 'package:project_x/src/features/profile_feature/domain/repository/profile_repository.dart';

class UpdatePhoneNumberUseCase {
  final ProfileRepository _profileRepository;

  const UpdatePhoneNumberUseCase(this._profileRepository);

  Future<void> call() async {
    await _profileRepository.updatePhone();
  }
}
