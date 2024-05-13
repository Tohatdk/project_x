import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_x/src/features/profile_feature/data/data_source/profile_data_source.dart';
import 'package:project_x/src/features/profile_feature/domain/entities/profile_entity.dart';
import 'package:project_x/src/features/profile_feature/domain/repository/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileDataSource _profileDataSource;

  ProfileRepositoryImpl(this._profileDataSource);

  @override
  Future<void> deleteAccount() async {
    await _profileDataSource.deleteAccount();
  }

  @override
  Future<ProfileEntity> getProfileData() async {
    return await _profileDataSource.getProfileData();
  }

  @override
  Future<void> updateEmail({required String email}) async {
    await _profileDataSource.updateEmail(email: email);
  }

  @override
  Future<void> updateUsername({required String username}) async {
    await _profileDataSource.updateUsername(username: username);
  }

  @override
  Future<UploadTask> uploadPhoto(XFile file) async {
    return _profileDataSource.uploadPhoto(file);
  }
}
