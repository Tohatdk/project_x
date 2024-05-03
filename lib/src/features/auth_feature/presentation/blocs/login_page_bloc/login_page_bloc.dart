import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_x/src/features/auth_feature/domain/usecase/sign_in_usecase.dart';
import 'package:project_x/src/features/auth_feature/presentation/view_models/email_text_from_view_model.dart';
import 'package:project_x/src/features/auth_feature/presentation/view_models/password_text_from_view_model.dart';

part 'login_page_bloc.freezed.dart';

part 'login_page_event.dart';

part 'login_page_state.dart';

class LoginPageBloc extends Bloc<LoginPageEvent, LoginPageState> {
  LoginPageBloc({required SignInUseCase signInUseCase})
      : _getLoginUseCase = signInUseCase,
        super(const LoginPageState()) {
    on<EmailTextFieldChangeEvent>(_onEmailChange);
    on<PasswordTextFieldChangeEvent>(_onPasswordChange);
    on<SignInSubmitEvent>(_onSignIn);
    on<TogglePasswordEvent>((_, emit) {
      final viewModel = state.passwordViewModel;
      emit(state.copyWith(
          passwordViewModel:
          viewModel.copyWith(isObscured: !viewModel.isObscured),),);
    });
    on<ChangeStatusEvent>((event,emit){
      emit(state.copyWith(status: LoginPageStatus.none));
    });
  }

  final SignInUseCase _getLoginUseCase;

  Future<void> _onEmailChange(
      EmailTextFieldChangeEvent event, Emitter<LoginPageState> emit,) async {
    emit(state.copyWith(
      emailViewModel: state.emailViewModel.copyWith(
        value: event.email,
      ),
    ),);
  }

  Future<void> _onPasswordChange(
      PasswordTextFieldChangeEvent event, Emitter<LoginPageState> emit,) async {
    emit(state.copyWith(
      passwordViewModel: state.passwordViewModel.copyWith(
        value: event.password,
      ),
    ),);
  }

  Future<void> _onSignIn(
      SignInSubmitEvent event, Emitter<LoginPageState> emit,) async {
    emit(state.copyWith(
      status: LoginPageStatus.loading,
    ),);

    final email = state.emailViewModel;
    final isEmailValid = EmailValidator.validate(email.value);
    final password = state.passwordViewModel;
    if (!isEmailValid && password.value.length < 6) {
      emit(state.copyWith(
        errorMessage: 'Проверьте корректность ваших данных',
        status: LoginPageStatus.failure,
      ),);
      return;
    }

      final result = await _getLoginUseCase.execute(
        email: email.value,
        password: state.passwordViewModel.value,
      );

      result.fold(
        (left) => emit(state.copyWith(
          errorMessage: left.message,
          status: LoginPageStatus.failure,
        ),),
        (right) => emit(state.copyWith(
          status: LoginPageStatus.succeed,
        ),),
      );
  }
}
