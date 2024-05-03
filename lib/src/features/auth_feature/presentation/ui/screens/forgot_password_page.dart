import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:project_x/services/routes/app_route_paths.dart';
import 'package:project_x/src/features/auth_feature/presentation/blocs/forgot_password_page_bloc/forgot_password_page_bloc.dart';
import 'package:project_x/src/features/auth_feature/presentation/ui/screens/components/email_text_form_field.dart';
import 'package:project_x/src/features/auth_feature/presentation/ui/screens/components/password_text_form_field.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController passwordEditingController =
      TextEditingController();
  final TextEditingController confirmPasswordEditingController =
      TextEditingController();
  final TextEditingController codeEditingController = TextEditingController();

  /// pass, confirmPass, code controllers
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      emailEditingController.addListener(() {
        context
            .read<ForgotPasswordPageBloc>()
            .add(EmailInputEvent(email: emailEditingController.text));
      });
      passwordEditingController.addListener(() {
        context
            .read<ForgotPasswordPageBloc>()
            .add(PasswordInputEvent(password: passwordEditingController.text));
      });
      confirmPasswordEditingController.addListener(() {
        context.read<ForgotPasswordPageBloc>().add(ConfirmPasswordInputEvent(
            password: confirmPasswordEditingController.text,),);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: BlocConsumer<ForgotPasswordPageBloc, ForgotPasswordPageState>(
          listener: (context, state) {
            if (state.status == ForgotPageStatus.failure) {
              showFailure(context, state.errorMessage);
            } else if (state.status == ForgotPageStatus.loading) {
            } else if (state.status == ForgotPageStatus.resetSucceed) {
              GoRouter.of(context).go(AppRoutePaths.loginPageRoute.fullPath);
            }
          },
          builder: (context, state) {
            final bloc = context.read<ForgotPasswordPageBloc>();

            switch (state.status) {
              case ForgotPageStatus.resetSucceed:
              case ForgotPageStatus.codeSent:
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PasswordTextFormField(
                      controller: passwordEditingController,
                      viewModel: state.passwordViewModel,
                      onTap: () {
                        bloc.add(
                            TogglePasswordEvent(),);
                      },
                    ),
                    PasswordTextFormField(
                      controller: confirmPasswordEditingController,
                      viewModel: state.repeatPasswordFromViewModel,
                      onTap: (){
                        bloc.add(ToggleConfirmationPasswordEvent());
                      },
                    ),
                    TextFormField(
                      controller: codeEditingController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Code',
                        errorText: state.errorMessage,
                      ),
                    ),
                  ],
                );
              default:
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    EmailTextFormField(
                      controller: emailEditingController,
                      viewModel: state.emailViewModel,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ElevatedButton(
                      onPressed: () => bloc.add(EmailSubmitEvent()),
                      child: const Text('Continue'),
                    ),
                  ],
                );
            }
          },
        ),
      ),
    );
  }

  void showFailure(BuildContext context, String errorMessage) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(errorMessage),
        actions: [
          TextButton(
            onPressed: () {
              context.pop(); // Закрыть диалог
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    emailEditingController.dispose();
    passwordEditingController.dispose();
    confirmPasswordEditingController.dispose();
    codeEditingController.dispose();
    super.dispose();
  }
}

