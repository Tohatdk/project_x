
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_x/src/features/profile_feature/domain/repository/profile_repository.dart';

class UploadPhotoUseCase{
  final ProfileRepository _profileRepository;

  UploadPhotoUseCase(this._profileRepository);

  Future<UploadTask> execute(XFile file) async{
    return _profileRepository.uploadPhoto(file);
  }

}
