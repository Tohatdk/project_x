import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:project_x/src/features/auth_feature/domain/usecase/get_register_usecase.dart';
import 'package:project_x/src/features/auth_feature/presentation/view_models/email_text_from_view_model.dart';
import 'package:project_x/src/features/auth_feature/presentation/view_models/password_text_from_view_model.dart';
import 'package:rxdart/rxdart.dart';

part 'register_page_bloc.freezed.dart';

part 'register_page_event.dart';

part 'register_page_state.dart';

typedef StateEmitter = Emitter<RegisterPageState>;

class RegisterPageBloc extends Bloc<RegisterPageEvent, RegisterPageState> {
  RegisterPageBloc({required CreateUserUseCase createUserUsecase})
      : _getRegisterUseCase = createUserUsecase,
        super(const RegisterPageState()) {
    on<EditEmailEvent>(_editEmail, transformer: _debounceEvent<EditEmailEvent>);
    on<EditPasswordEvent>(_changePassword,
        transformer: _debounceEvent<EditPasswordEvent>,);
    on<EditConfimrationPasswordEvent>(_editConfirmPass,
        transformer: _debounceEvent<EditConfimrationPasswordEvent>,);
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
      on<SendDataEvent>(_submit);
      on<ClearError>((e, emit) {
        emit(state.copyWith(message: '', status: RegistrationStatus.none));
      });
    }

  final CreateUserUseCase _getRegisterUseCase; // Приватное поле для экземпляра CreateUserUseCase

  Future<void> _changePassword(EditPasswordEvent event, // Функция для изменения пароля
      StateEmitter emit,) async {
    final passVm = state.passwordViewModel; // Получаем текущий viewModel для пароля
    emit(state.copyWith( // Изменяем состояние, обновляя значение пароля в viewModel
        passwordViewModel: passVm.copyWith(
          value: event.password, // Устанавливаем новое значение пароля
        ),),);
  }

  Future<void> _editEmail(EditEmailEvent event, StateEmitter emit) async { // Функция для изменения email
    final newEmailTextViewModel = // Создаем новый viewModel с обновленным email
    state.emailViewModel.copyWith(value: event.email);
    emit(state.copyWith(emailViewModel: newEmailTextViewModel)); // Изменяем состояние, устанавливая новый viewModel для email
  }

  Future<void> _editConfirmPass(EditConfimrationPasswordEvent event, // Функция для изменения повторного ввода пароля
      Emitter<RegisterPageState> emit,) async {
    final password = event.confirmationPassword; // Получаем значение повторного ввода пароля из события
    final viewModel = state.repeatPasswordFromViewModel; // Получаем текущий viewModel для повторного ввода пароля
    emit(state.copyWith( // Изменяем состояние, обновляя значение повторного ввода пароля в viewModel
        repeatPasswordFromViewModel: viewModel.copyWith(
          value: password, // Устанавливаем новое значение повторного ввода пароля
        ),),);
  }

  Future<void> _submit(SendDataEvent event, // Функция для отправки данных
      Emitter<RegisterPageState> emit,) async {
    emit(state.copyWith( // Изменяем состояние, устанавливая статус загрузки
      status: RegistrationStatus.loading,
    ),);
    final validEmail = isEmailValid(emit); // Проверяем валидность email
    final isPasswordValid = isPasswordsValid(emit); // Проверяем валидность пароля
    final bool isAllDataIsValid =
        isPasswordValid && validEmail; // Проверяем, что все данные валидны

    if (!isAllDataIsValid) { // Если не все данные валидны
      emit(state.copyWith( // Изменяем состояние, устанавливая статус ошибки и сообщение
          status: RegistrationStatus.failure,
          message: 'Fucking shit happened on front hgside',),);
      return;
    }

    final result = await _getRegisterUseCase.call( // Вызываем метод call у экземпляра _getRegisterUseCase
        email: state.emailViewModel.value, // Передаем значение email
        password: state.passwordViewModel.value,); // Передаем значение пароля

    result.fold(
          (left) => // Если есть ошибки
      emit(state.copyWith(
          status: RegistrationStatus.failure, message: left.message,),), // Изменяем состояние, устанавливая статус ошибки и сообщение
          (right) => // Если операция успешна
      emit(state.copyWith(
          status: RegistrationStatus.succeed, // Изменяем состояние, устанавливая статус успешной авторизации и сообщение
          message: 'Успешно авторизован',),),
    );
  }

  // Вспомогательные функции для проверки валидности email и пароля
  bool isPasswordsValid(Emitter<RegisterPageState> emit) {
    final passwordRegex = RegExp(r'^(?=.*?[A-Z])(?=.*?[0-9]).{6,}$'); // Регулярное выражение для проверки пароля
    final isValid = passwordRegex.hasMatch(state.passwordViewModel.value); // Проверяем пароль по регулярному выражению

    final passVm = state.passwordViewModel; // Получаем текущий viewModel для пароля
    final confirmPassVm = state.repeatPasswordFromViewModel; // Получаем текущий viewModel для повторного ввода пароля
    String? errorMessage;
    if (!isValid) { // Если пароль не валиден
      errorMessage = 'Пароли не соответсвует требованиям!'; // Устанавливаем сообщение об ошибке
    }

    final isIdentical = passVm.value == confirmPassVm.value; // Проверяем совпадение паролей

    String? confirmError;
    if (!isIdentical) { // Если пароли не совпадают
      confirmError = 'Пароли не совпадают'; // Устанавливаем сообщение об ошибке
    }

    emit(state.copyWith( // Изменяем состояние, обновляя viewModel для пароля и повторного ввода пароля
      passwordViewModel: passVm.copyWith(
        isValid: isValid,
        errorMessage: errorMessage,
      ),
      repeatPasswordFromViewModel: confirmPassVm.copyWith(
        isValid: isIdentical,
        errorMessage: confirmError,
      ),
    ),);

    return isValid && isIdentical; // Возвращаем true, если пароли валидны и совпадают
  }

  bool isEmailValid(Emitter<RegisterPageState> emit) { // Функция для проверки валидности email
    final emailRegex = RegExp( // Регулярное выражение для проверки email
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",);
    final isValid = emailRegex.hasMatch(state.emailViewModel.value); // Проверяем email по регулярному выражению

    if (!isValid) { // Если email не валиден
      final emailVm = state.emailViewModel.copyWith( // Создаем новый viewModel с сообщением об ошибке
        isValid: isValid,
        errorMessage: 'Неправильный email',
      );
      emit(state.copyWith(emailViewModel: emailVm)); // Изменяем состояние, обновляя viewModel для email
    }

    return isValid; // Возвращаем результат проверки
  }

  Stream<T> _debounceEvent<T extends RegisterPageEvent>(Stream<T> stream, // Функция для добавления задержки к событиям
      Stream<T> Function(T) s,) =>
      stream.debounceTime(const Duration(milliseconds: 500)).asyncExpand(s); // Применяем задержку к событиям
}