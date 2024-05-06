import 'package:project_x/src/features/profile_feature/domain/entities/profile_entity.dart';

abstract interface class ProfileRepository {
  Future<ProfileEntity> getProfileData();

  Future<void> updateEmail({
    required String email,
  });

  Future<void> updatePhoto({
    required String photoUrl,
  });

  Future<void> updateUsername({
    required String username,
  });

  Future<void> deleteAccount();
}
