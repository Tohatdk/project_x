import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_x/src/features/auth_feature/domain/usecase/logout_use_case.dart';
import 'package:project_x/src/features/profile_feature/domain/usecase/upload_photo_usecase.dart';

part 'profile_page_event.dart';

part 'profile_page_state.dart';

class ProfilePageBloc extends Bloc<ProfilePageEvent, ProfilePageState> {
  ProfilePageBloc({
    required LogoutUseCase logoutUseCase,
    required UploadPhotoUseCase uploadPhotoUseCase,
  })  : _logoutUseCase = logoutUseCase,
        _uploadPhotoUseCase = uploadPhotoUseCase,
        super(ProfilePageState('')) {
    on<SignoutEvent>(_logout);
    on<UploadPhotoEvent>(_uploadPhoto);
  }

  final LogoutUseCase _logoutUseCase;
  final UploadPhotoUseCase _uploadPhotoUseCase;

  Future<void> _logout(
    SignoutEvent event,
    Emitter<ProfilePageState> emit,
  ) async {
    await _logoutUseCase.signOut();
    emit(ProfilePageState(state.loggedOut));
  }

  Future<void> _uploadPhoto(
    UploadPhotoEvent event,
    Emitter<ProfilePageState> emit,
  ) async {
    final Stopwatch stopwatch = Stopwatch();

    stopwatch.start();
    final ImagePicker picker = ImagePicker();
    int quality = 100;

    if (event.value == ImageSource.camera) {
      quality = 20;
    }

    final pickedFile =
        await picker.pickImage(source: event.value, imageQuality: quality);

    if (pickedFile == null) {
      //TODO: handle o image picked
      return;
    }

    final uploadTask = await _uploadPhotoUseCase.execute(pickedFile);

    uploadTask.snapshotEvents.listen((event) {
      switch (event.state) {
        case TaskState.running:
        // TODO: show loading state
        case TaskState.success:
        case TaskState.error:
        //TODO: Show error message
        case TaskState.paused:
        case TaskState.canceled:
        //TODO: cancel uploading photo
      }
    });
  }
}
