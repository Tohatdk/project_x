import 'package:freezed_annotation/freezed_annotation.dart';
part 'password_text_from_view_model.freezed.dart';
@freezed
class PasswordFormViewModel with _$PasswordFormViewModel{
  const factory PasswordFormViewModel({
    @Default('') String value,
      String? errorMessage,
    @Default(false) bool isValid,
    @Default(true) bool isObscured,
})=_PasswordFormViewModel;
}
