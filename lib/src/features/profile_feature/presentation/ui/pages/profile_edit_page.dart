import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:project_x/services/routes/app_route_paths.dart';
import 'package:project_x/src/features/profile_feature/presentation/bloc/bloc_args.dart';
import 'package:project_x/src/features/profile_feature/presentation/bloc/profile_edit_page_bloc/profile_edit_page_bloc.dart';
import 'package:project_x/src/features/profile_feature/presentation/ui/pages/components/edit_profile_avatar.dart';
import 'package:project_x/src/features/profile_feature/presentation/ui/pages/components/email_edit_text_form_field.dart';
import 'package:project_x/src/features/profile_feature/presentation/ui/pages/components/user_name_edit_text_form_field.dart';

class ProfileEditPage extends StatefulWidget {
  final ProfileBlocsCommunicationsArgs args;

  const ProfileEditPage({
    super.key,
    required this.args,
  });

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.args.username ?? '');
    _emailController = TextEditingController(text: widget.args.email);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _emailController.addListener(() {
        context
            .read<ProfileEditPageBloc>()
            .add(UpdateEmailEvent(email: _emailController.text));
      });
      _nameController.addListener(() {
        context.read<ProfileEditPageBloc>().add(
              UpdateUserNameEvent(_nameController.text),
            );
      });
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileEditPageBloc, ProfileEditPageState>(
      listenWhen: (oldState, newState) {
        return oldState.status != newState.status;
      },
      listener: (BuildContext context, ProfileEditPageState state) {
        switch (state.status) {
          case ProfileEditStatus.failure:
            context.loaderOverlay.hide();
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text(state.message),
                  actions: [
                    TextButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: const Text('OK'),
                    ),
                  ],
                );
              },
            );
          case ProfileEditStatus.succeed:
            context.loaderOverlay.hide();
            context.go(AppRoutePaths.profileEditPageRoute.fullPath);
          default:
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              final state = context.read<ProfileEditPageBloc>().state;

              String email = widget.args.email;
              String? username = widget.args.username;
              String? photo = widget.args.photoUrl;
              final emailVm = state.emailEditViewModel;
              final nameVm = state.userNameEditViewModel;
              final photoVm = state.photoUrlEditViewModel;

              if (emailVm.value != email && emailVm.isValid) {
                email = emailVm.value;
              }
              if (nameVm.value != username &&
                  (nameVm.value ?? '').length >= 3) {
                username = nameVm.value;
              }
              if (photoVm.value != photo) {
                photo = photoVm.value;
              }

              context.pop(
                ProfileBlocsCommunicationsArgs(
                  email: email,
                  username: username,
                  photoUrl: photo,
                ),
              );
            },
            child: const Icon(Icons.arrow_back),
          ),
          title: const Text('Edit Profile'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: BlocBuilder<ProfileEditPageBloc, ProfileEditPageState>(
            builder: (context, state) {
              final emailEditViewModel = state.emailEditViewModel;
              final userNameEditViewModel = state.userNameEditViewModel;
              final photoUrlEditViewModel = state.photoUrlEditViewModel;
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: EditProfileAvatar(
                      viewModel: photoUrlEditViewModel,
                      photoUrl: widget.args.photoUrl,
                    ),
                  ),
                  const SizedBox(height: 10),
                  UserNameEditTextFormField(
                    controller: _nameController,
                    viewModel: userNameEditViewModel,
                  ),
                  const SizedBox(height: 10),
                  EmailEditTextFormField(
                    controller: _emailController,
                    viewModel: emailEditViewModel,
                  ),
                  const SizedBox(height: 50),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
