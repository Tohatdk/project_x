part of 'profile_edit_page_bloc.dart';

enum ProfileEditStatus { none, loading, failure, succeed }

@freezed
class ProfileEditPageState with _$ProfileEditPageState {
  const factory ProfileEditPageState({
    @Default(ProfileEntityViewModel(email: '')) ProfileEntityViewModel profileEntityViewModel,
    @Default(ProfileEditStatus.none) ProfileEditStatus status,
    @Default('') String message,
  })=_ProfileEditPageState;
}