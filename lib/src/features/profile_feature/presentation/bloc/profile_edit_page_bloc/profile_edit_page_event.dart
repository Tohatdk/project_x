part of 'profile_edit_page_bloc.dart';

abstract class ProfileEditPageEvent {}

class UpdateEmailEvent extends ProfileEditPageEvent {
  final String email;

  UpdateEmailEvent({required this.email});
}

class UpdateUserNameEvent extends ProfileEditPageEvent {
  final String userName;

  UpdateUserNameEvent(this.userName);
}

class UpdatePhotoUrlEvent extends ProfileEditPageEvent {
  final String photoUrl;

  UpdatePhotoUrlEvent(this.photoUrl);
}
