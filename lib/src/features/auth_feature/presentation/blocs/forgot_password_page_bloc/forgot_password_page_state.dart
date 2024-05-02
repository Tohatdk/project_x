part of 'forgot_password_page_bloc.dart';

enum ForgotPageStatus {
  none,
  loading,
  failure,
  codeSent,
  resetSucceed,
}

@freezed
class ForgotPasswordPageState with _$ForgotPasswordPageState {
  const factory ForgotPasswordPageState({
    @Default(EmailFormViewModel()) EmailFormViewModel emailViewModel,
    @Default(PasswordFormViewModel()) PasswordFormViewModel passwordViewModel,
    @Default(PasswordFormViewModel())
    PasswordFormViewModel repeatPasswordFromViewModel,
    @Default('') String errorMessage,
    @Default(ForgotPageStatus.none) ForgotPageStatus status,
  }) = _ForgotPasswordPageState;
}
