part of 'login_page_bloc.dart';

abstract class LoginPageEvent {
  const LoginPageEvent();
}

class EmailTextFieldChangeEvent extends LoginPageEvent {
  final String email;

  const EmailTextFieldChangeEvent({required this.email});
}

class PasswordTextFieldChangeEvent extends LoginPageEvent {
  final String password;

  const PasswordTextFieldChangeEvent({required this.password});
}

class SignInSubmitEvent extends LoginPageEvent {}

class ChangeStatusEvent extends LoginPageEvent {}
class TogglePasswordEvent extends LoginPageEvent{}