part of 'register_page_bloc.dart';

enum RegistrationStatus {none, loading, failure, succeed}

@freezed
class RegisterPageState with _$RegisterPageState {
  const factory RegisterPageState({
    @Default(EmailFormViewModel()) EmailFormViewModel emailViewModel,
    @Default(PasswordFormViewModel()) PasswordFormViewModel passwordViewModel,
    @Default(PasswordFormViewModel()) PasswordFormViewModel repeatPasswordFromViewModel,
    @Default(RegistrationStatus.none) RegistrationStatus status,
    @Default('') String message,
  }) = _RegisterPageState;
}
