import 'package:project_x/src/features/profile_feature/presentation/view_models/email_edit_view_model.dart';
import 'package:project_x/src/features/profile_feature/presentation/view_models/photo_url_edit_view_model.dart';
import 'package:project_x/src/features/profile_feature/presentation/view_models/user_name_edit_view_model.dart';

class EditPageResultArgs {
  final EmailEditViewModel emailEditViewModel;
  final UserNameEditViewModel userNameEditViewModel;
  final PhotoUrlEditViewModel photoUrlEditViewModel;

  EditPageResultArgs({
    required this.emailEditViewModel,
    required this.userNameEditViewModel,
    required this.photoUrlEditViewModel,
  });
}

class ProfileEditPageBlocArgs {
  final EmailEditViewModel emailEditViewModel;

  ProfileEditPageBlocArgs(this.emailEditViewModel);
}
