import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_x/core/utils/stream_debounce.dart';
import 'package:project_x/src/features/profile_feature/domain/usecase/update_email_usecase.dart';
import 'package:project_x/src/features/profile_feature/domain/usecase/update_username_usecase.dart';
import 'package:project_x/src/features/profile_feature/presentation/bloc/bloc_args.dart';
import 'package:project_x/src/features/profile_feature/presentation/view_models/email_edit_view_model.dart';
import 'package:project_x/src/features/profile_feature/presentation/view_models/photo_url_edit_view_model.dart';
import 'package:project_x/src/features/profile_feature/presentation/view_models/user_name_edit_view_model.dart';

part 'profile_edit_page_state.dart';

part 'profile_edit_page_event.dart';

part 'profile_edit_page_bloc.freezed.dart';

class ProfileEditPageBloc
    extends Bloc<ProfileEditPageEvent, ProfileEditPageState> {
  ProfileEditPageBloc({
    required UpdateEmailUseCase updateEmailUseCase,
    required UpdateUsernameUseCase updateUsernameUseCase,
    required ProfileBlocsCommunicationsArgs args,
  })  : _updateEmailUseCase = updateEmailUseCase,
        _updateUsernameUseCase = updateUsernameUseCase,
        super(
          ProfileEditPageState(
            emailEditViewModel: EmailEditViewModel(value: args.email),
            photoUrlEditViewModel: PhotoUrlEditViewModel(value: args.photoUrl),
            userNameEditViewModel: UserNameEditViewModel(value: args.username),
          ),
        ) {
    on<UpdateEmailEvent>(
      _editEmail,
      transformer: debounceEvent<UpdateEmailEvent>,
    );
    on<UpdateUserNameEvent>(
      _editUserName,
      transformer: debounceEvent<UpdateUserNameEvent>,
    );
  }

  final UpdateEmailUseCase _updateEmailUseCase;
  final UpdateUsernameUseCase _updateUsernameUseCase;

  Future<void> _editEmail(
    UpdateEmailEvent event,
    Emitter<ProfileEditPageState> emit,
  ) async {
    try {
      final isValidEmail =
          isEmailValid(event.email); // Проверяем валидность email

      String? emailTextFieldError;

      if (!isValidEmail) {
        emailTextFieldError = 'Неправильный email';
      }

      final newEmail = state.emailEditViewModel.copyWith(
        value: event.email,
        isValid: isValidEmail,
        errorMessage: emailTextFieldError,
      );

      emit(state.copyWith(emailEditViewModel: newEmail));

      if (!isValidEmail) {
        return;
      }

      await _updateEmailUseCase.call(email: event.email);
    } catch (e) {
      emit(
        state.copyWith(
          status: ProfileEditStatus.failure,
          message: '$e',
        ),
      );
    }
  }

  Future<void> _editUserName(
    UpdateUserNameEvent event,
    Emitter<ProfileEditPageState> emit,
  ) async {
    final vm = state.userNameEditViewModel;
    try {
      if (event.userName.length >= 3) {
        final newUserName =
            vm.copyWith(value: event.userName, errorMessage: null);
        emit(state.copyWith(userNameEditViewModel: newUserName));
        await _updateUsernameUseCase.call(username: event.userName);
      } else {
        emit(
          state.copyWith(
            userNameEditViewModel: vm.copyWith(
              errorMessage: 'Имя должно содержать минимум 3 буквы',
            ),
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: ProfileEditStatus.failure,
          message: '$e',
        ),
      );
    }
  }

  bool isEmailValid(String email) {
    final emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );

    final isValid = emailRegex.hasMatch(email);

    return isValid;
  }
}
