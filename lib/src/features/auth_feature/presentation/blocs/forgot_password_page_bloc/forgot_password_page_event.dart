part of 'forgot_password_page_bloc.dart';

abstract class ForgotPasswordPageEvent {
  const ForgotPasswordPageEvent();
}

class EmailInputEvent extends ForgotPasswordPageEvent {
  final String email;

  const EmailInputEvent({required this.email});
}

class PasswordInputEvent extends ForgotPasswordPageEvent {
  final String password;

  const PasswordInputEvent({required this.password});
}

class ConfirmPasswordInputEvent extends ForgotPasswordPageEvent {
  final String password;

  const ConfirmPasswordInputEvent({required this.password});
}
class CodeInputEvent extends ForgotPasswordPageEvent {
  final String code;

  const CodeInputEvent({required this.code});
}

class EmailSubmitEvent extends ForgotPasswordPageEvent {}

class SubmitCodeAndPasswordEvent extends ForgotPasswordPageEvent {
  final String code;
  final String password;

  SubmitCodeAndPasswordEvent({required this.code, required this.password});
}
class TogglePasswordEvent extends ForgotPasswordPageEvent{}
class ToggleConfirmationPasswordEvent extends ForgotPasswordPageEvent{}