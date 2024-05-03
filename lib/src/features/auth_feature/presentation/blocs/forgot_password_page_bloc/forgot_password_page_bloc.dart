
import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_x/src/features/auth_feature/domain/usecase/confitm_password_reset_usecase.dart';
import 'package:project_x/src/features/auth_feature/domain/usecase/send_reset_password_request_usecase.dart';
import 'package:project_x/src/features/auth_feature/presentation/view_models/email_text_from_view_model.dart';
import 'package:project_x/src/features/auth_feature/presentation/view_models/password_text_from_view_model.dart';

part 'forgot_password_page_bloc.freezed.dart';

part 'forgot_password_page_event.dart';

part 'forgot_password_page_state.dart';

class ForgotPasswordPageBloc
    extends Bloc<ForgotPasswordPageEvent, ForgotPasswordPageState> {
  ForgotPasswordPageBloc(
      {required SendResetPasswordRequestUseCase sendResetPasswordRequestUseCase, required ConfirmPasswordUseCase confirmPasswordUseCase,})
      : _getResetPasswordRequestUseCase = sendResetPasswordRequestUseCase,
        _getconfirmPasswordUseCase = confirmPasswordUseCase,
        super(const ForgotPasswordPageState()) {
    ///inputs start
    on<EmailInputEvent>(_onEmailChange);
    on<PasswordInputEvent>(_handlePasswordInput);
    on<ConfirmPasswordInputEvent>(_handleConfirmPasswordInput);
    on<CodeInputEvent>(_handleCodeInput);
    on<TogglePasswordEvent>((_, emit) {
      final viewModel = state.passwordViewModel;
      emit(state.copyWith(
          passwordViewModel:
          viewModel.copyWith(isObscured: !viewModel.isObscured),),);
    });
    on<ToggleConfirmationPasswordEvent>((_, emit) {
      final viewModel = state.repeatPasswordFromViewModel;
      emit(state.copyWith(
          repeatPasswordFromViewModel:
          viewModel.copyWith(isObscured: !viewModel.isObscured),),);
    });
    ///inputs end
    on<EmailSubmitEvent>(_submitEmail);
    on<SubmitCodeAndPasswordEvent>(_submitCodeAndPassword);
  }

  final ConfirmPasswordUseCase _getconfirmPasswordUseCase;
  final SendResetPasswordRequestUseCase _getResetPasswordRequestUseCase;

  ///Event handlers begin
  Future<void> _onEmailChange(EmailInputEvent event,
      Emitter<ForgotPasswordPageState> emit,) async {
    emit(state.copyWith(
      emailViewModel: state.emailViewModel.copyWith(
        value: event.email,
      ),
    ),);
  }

  Future<void> _handlePasswordInput(PasswordInputEvent event,
      Emitter<ForgotPasswordPageState> emit,) async {
    final passVm = state.passwordViewModel;
    emit(state.copyWith(
        passwordViewModel: passVm.copyWith(
          value: event.password,
        ),),);
  }

  Future<void> _handleConfirmPasswordInput(ConfirmPasswordInputEvent event,
      Emitter<ForgotPasswordPageState> emit,) async {
    final password = event.password;
    final viewModel = state.repeatPasswordFromViewModel;
    emit(state.copyWith(
        repeatPasswordFromViewModel: viewModel.copyWith(
          value: password,
        ),),);
  }


  Future<void> _handleCodeInput(CodeInputEvent event,
      Emitter<ForgotPasswordPageState> emit,) async {
    final code = event.code;
    if (code.length != 4) {
      emit(state.copyWith(
        errorMessage: 'Код должен состоять из 4 символов',
        status: ForgotPageStatus.failure,
      ),);
      return;
    }
  }


  ///Event handlers end


  ///Submissions begin
  Future<void> _submitEmail(EmailSubmitEvent event,
      Emitter<ForgotPasswordPageState> emit,) async {
    emit(state.copyWith(
      status: ForgotPageStatus.loading,
    ),);
    final email = state.emailViewModel;
    final isEmailValid = EmailValidator.validate(email.value);
    if (!isEmailValid) {
      emit(state.copyWith(
        errorMessage: 'Проверьте корректность ваших данных',
        status: ForgotPageStatus.failure,
      ),);
      return;
    }
    final result = await _getResetPasswordRequestUseCase.call(
      email: email.value,
    );

    result.fold(
          (error) {
        emit(state.copyWith(
          errorMessage: 'Ошибка: ${error.message}',
          status: ForgotPageStatus.failure,
        ),);
      },
          (_) {
        emit(state.copyWith(
          status: ForgotPageStatus.codeSent,
        ),);
      },
    );
  }

  Future<void> _submitCodeAndPassword(SubmitCodeAndPasswordEvent event,
      Emitter<ForgotPasswordPageState> emit,) async {
    emit(state.copyWith(
      status: ForgotPageStatus.loading,
    ),);
    final isPasswordValid = isPasswordsValid(emit);
    if (!isPasswordValid) {
      emit(state.copyWith(
          status: ForgotPageStatus.failure,
          errorMessage: 'Fucking shit happened on front hgside',),);
      return;
    }
    final result = await _getconfirmPasswordUseCase
        .call(
      newPassword: state.passwordViewModel.value, // Передаем новый пароль
      code: event.code, // Передаем код для сброса пароля из события
    );

    result.fold(
          (error) {
        emit(state
            .copyWith(
          errorMessage: 'Ошибка: ${error.message}',
          status: ForgotPageStatus.failure,
        ),);
      },
          (_) {
        emit(state
            .copyWith(
          status: ForgotPageStatus.resetSucceed,
        ),);
      },
    );
  }

  ///Submissions end


  bool isPasswordsValid(Emitter<ForgotPasswordPageState> emit) {
    final passwordRegex = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[0-9]).{6,}$',); // Регулярное выражение для проверки пароля
    final isValid = passwordRegex.hasMatch(state.passwordViewModel
        .value,); // Проверяем пароль по регулярному выражению

    final passVm = state
        .passwordViewModel; // Получаем текущий viewModel для пароля
    final confirmPassVm = state
        .repeatPasswordFromViewModel; // Получаем текущий viewModel для повторного ввода пароля
    String? errorMessage;
    if (!isValid) { // Если пароль не валиден
      errorMessage =
      'Пароли не соответсвует требованиям!'; // Устанавливаем сообщение об ошибке
    }

    final isIdentical = passVm.value ==
        confirmPassVm.value; // Проверяем совпадение паролей

    String? confirmError;
    if (!isIdentical) { // Если пароли не совпадают
      confirmError =
      'Пароли не совпадают'; // Устанавливаем сообщение об ошибке
    }

    emit(state
        .copyWith( // Изменяем состояние, обновляя viewModel для пароля и повторного ввода пароля
      passwordViewModel: passVm.copyWith(
        isValid: isValid,
        errorMessage: errorMessage,
      ),
      repeatPasswordFromViewModel: confirmPassVm.copyWith(
        isValid: isIdentical,
        errorMessage: confirmError,
      ),
    ),);

    // Возвращаем true, если все проверки пройдены успешно
    return isValid && isIdentical;
  }
}
