part of'register_page_bloc.dart';

@freezed
class RegisterPageEvent with _$RegisterPageEvent{
  const factory RegisterPageEvent.editEmail(String email) = EditEmailEvent;
  const factory RegisterPageEvent.editPassword(String password) = EditPasswordEvent;
  const factory RegisterPageEvent.editConfirmationPassword(String confirmationPassword) = EditConfimrationPasswordEvent;
  const factory RegisterPageEvent.togglePassword() = TogglePasswordEvent;
  const factory RegisterPageEvent.toggleConfirmationPassword() = ToggleConfirmationPasswordEvent;
  const factory RegisterPageEvent.sendData() = SendDataEvent;
  const factory RegisterPageEvent.clearErrors() = ClearError;
}

