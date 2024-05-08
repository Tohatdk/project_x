import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_name_edit_view_model.freezed.dart';

@freezed
class UserNameEditViewModel with _$UserNameEditViewModel {
  const factory UserNameEditViewModel({
    String? userName,
    String? errorMessage,
  }) = _UserNameEditViewModel;
}
