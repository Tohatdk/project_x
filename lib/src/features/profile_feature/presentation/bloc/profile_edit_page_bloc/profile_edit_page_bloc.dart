import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_x/src/features/profile_feature/domain/usecase/delete_account_usecase.dart';
import 'package:project_x/src/features/profile_feature/domain/usecase/get_profile_data_usecase.dart';
import 'package:project_x/src/features/profile_feature/domain/usecase/update_email_usecase.dart';
import 'package:project_x/src/features/profile_feature/domain/usecase/update_username_usecase.dart';
import 'package:project_x/src/features/profile_feature/presentation/view_models/profile_entity_view_model.dart';

part 'profile_edit_page_state.dart';

part 'profile_edit_page_event.dart';

part 'profile_edit_page_bloc.freezed.dart';

class ProfileEditPageBloc
    extends Bloc<ProfileEditPageEvent, ProfileEditPageState> {
  ProfileEditPageBloc({
    required UpdateEmailUseCase updateEmailUseCase,
    required UpdateUsernameUseCase updateUsernameUseCase,
    required DeleteAccountUseCase deleteAccountUseCase,
    required GetProfileDataUseCase getProfileDataUseCase,
  })  : _updateEmailUseCase = updateEmailUseCase,
        _updateUsernameUseCase = updateUsernameUseCase,
        _deleteAccountUseCase = deleteAccountUseCase,
        _getProfileDataUseCase = getProfileDataUseCase,
        super(const ProfileEditPageState());

  final UpdateEmailUseCase _updateEmailUseCase;
  final UpdateUsernameUseCase _updateUsernameUseCase;
  final DeleteAccountUseCase _deleteAccountUseCase;
  final GetProfileDataUseCase _getProfileDataUseCase;

  Future<void> _editEmail() async {}

  Future<void> _editUserName() async {}
}
