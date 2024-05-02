part of 'login_page_bloc.dart';

enum LoginPageStatus{none,loading,failure,succeed}

@freezed
class LoginPageState with _$LoginPageState{
const factory LoginPageState({
  @Default(EmailFormViewModel()) EmailFormViewModel emailViewModel,
  @Default(PasswordFormViewModel()) PasswordFormViewModel passwordViewModel,
  @Default(LoginPageStatus.none) LoginPageStatus status,
  @Default('') String errorMessage,
})=_LoginPageState;
}

