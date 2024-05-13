part of 'profile_edit_page_bloc.dart';

enum ProfileEditStatus { none, loading, failure, succeed }

@freezed
class ProfileEditPageState with _$ProfileEditPageState {
  const factory ProfileEditPageState({
    required EmailEditViewModel emailEditViewModel,
    @Default(PhotoUrlEditViewModel())
    PhotoUrlEditViewModel photoUrlEditViewModel,
    @Default(UserNameEditViewModel())
    UserNameEditViewModel userNameEditViewModel,
    @Default(ProfileEditStatus.none) ProfileEditStatus status,
    @Default('') String message,
  }) = _ProfileEditPageState;
}
