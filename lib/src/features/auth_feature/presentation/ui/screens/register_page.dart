import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:project_x/services/routes/app_route_paths.dart';
import 'package:project_x/src/features/auth_feature/presentation/blocs/register_page_bloc/register_page_bloc.dart';
import 'package:project_x/src/features/auth_feature/presentation/ui/screens/components/email_text_form_field.dart';
import 'package:project_x/src/features/auth_feature/presentation/ui/screens/components/password_text_form_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController passwordEditingController =
      TextEditingController();
  final TextEditingController confirmPasswordEditingController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      emailEditingController.addListener(() {
        context
            .read<RegisterPageBloc>()
            .add(RegisterPageEvent.editEmail(emailEditingController.text));
      });
      passwordEditingController.addListener(() {
        context.read<RegisterPageBloc>().add(
              RegisterPageEvent.editPassword(passwordEditingController.text),
            );
      });
      confirmPasswordEditingController.addListener(() {
        context.read<RegisterPageBloc>().add(
              RegisterPageEvent.editConfirmationPassword(
                confirmPasswordEditingController.text,
              ),
            );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<RegisterPageBloc>();
    return BlocListener<RegisterPageBloc, RegisterPageState>(
      listenWhen: (context, oldState) {
        return oldState.status != RegistrationStatus.none;
      },
      listener: (BuildContext context, state) {
        switch (state.status) {
          case RegistrationStatus.loading:
            context.loaderOverlay.show();
          case RegistrationStatus.failure:
            context.loaderOverlay.hide();
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text(state.message),
                  actions: [
                    TextButton(
                      onPressed: () {
                        bloc.add(const RegisterPageEvent.clearErrors());
                        context.pop();
                      },
                      child: const Text('OK'),
                    ),
                  ],
                );
              },
            );
          case RegistrationStatus.succeed:
            context.loaderOverlay.hide();
            context.go(AppRoutePaths.homePageRoute.path);
          case RegistrationStatus.none:
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: BlocBuilder<RegisterPageBloc, RegisterPageState>(
            builder: (context, state) {
              final emailViewModel = state.emailViewModel;
              final passwordViewModel = state.passwordViewModel;
              final confirmPasswordViewModel =
                  state.repeatPasswordFromViewModel;
              final bloc = context.read<RegisterPageBloc>();

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Register Page'),
                  const SizedBox(
                    height: 10,
                  ),
                  EmailTextFormField(
                    viewModel: emailViewModel,
                    controller: emailEditingController,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  PasswordTextFormField(
                    controller: passwordEditingController,
                    viewModel: passwordViewModel,
                    onTap: () {
                      bloc.add(const RegisterPageEvent.togglePassword());
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  PasswordTextFormField(
                    controller: confirmPasswordEditingController,
                    viewModel: confirmPasswordViewModel,
                    hint: 'Подвтердите пароль',
                    onTap: () {
                      bloc.add(
                        const RegisterPageEvent.toggleConfirmationPassword(),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () =>
                        bloc.add(const RegisterPageEvent.sendData()),
                    child: const Text('Register'),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailEditingController.dispose();
    passwordEditingController.dispose();
    confirmPasswordEditingController.dispose();
    super.dispose();
  }
}
