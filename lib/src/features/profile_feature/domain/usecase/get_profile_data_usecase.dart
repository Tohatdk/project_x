import 'package:project_x/src/features/profile_feature/domain/entities/profile_entity.dart';
import 'package:project_x/src/features/profile_feature/domain/repository/profile_repository.dart';

class GetProfileDataUseCase {
  final ProfileRepository _profileRepository;

  const GetProfileDataUseCase(this._profileRepository);

  Future<ProfileEntity> call() async {
    final profileData = await _profileRepository.getProfileData();
    return profileData;
  }
}
