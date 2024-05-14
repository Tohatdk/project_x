import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_x/src/features/profile_feature/domain/entities/profile_entity.dart';

abstract interface class ProfileRepository {
  Future<ProfileEntity> getProfileData();

  Future<void> updateEmail({
    required String email,
  });

  Future<void> updateUsername({
    required String username,
  });

  Future<void> deleteAccount();

  Future<UploadTask> uploadPhoto(XFile file);
}
