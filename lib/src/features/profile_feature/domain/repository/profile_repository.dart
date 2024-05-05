import 'package:project_x/src/features/profile_feature/domain/entities/profile_entity.dart';

abstract interface class ProfileRepository {
  Future<ProfileEntity> getProfileData();

  Future<void> updateEmail();

  Future<void> updatePhone();

  Future<void> updatePhoto();

  Future<void> updateUsername();

  Future<void> deleteAccount();
}
