part of 'profile_page_bloc.dart';

abstract class ProfilePageEvent {}

class SignoutEvent extends ProfilePageEvent {}

class UploadPhotoEvent extends ProfilePageEvent {
  final ImageSource value;

  UploadPhotoEvent(this.value);
}
