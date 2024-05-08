part of 'profile_edit_page_bloc.dart';

abstract class ProfileEditPageEvent {}

class UpdateEmailEvent extends ProfileEditPageEvent {}

class UpdateUserNameEvent extends ProfileEditPageEvent {}

class DeleteAccountEvent extends ProfileEditPageEvent {}

class GetProfileDataEvent extends ProfileEditPageEvent {}
