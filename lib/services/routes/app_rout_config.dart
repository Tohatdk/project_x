import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:project_x/di_dart.dart';
import 'package:project_x/services/routes/app_route_paths.dart';
import 'package:project_x/src/features/auth_feature/domain/usecase/confitm_password_reset_usecase.dart';
import 'package:project_x/src/features/auth_feature/domain/usecase/get_register_usecase.dart';
import 'package:project_x/src/features/auth_feature/domain/usecase/logout_use_case.dart';
import 'package:project_x/src/features/auth_feature/domain/usecase/send_reset_password_request_usecase.dart';
import 'package:project_x/src/features/auth_feature/domain/usecase/sign_in_usecase.dart';
import 'package:project_x/src/features/auth_feature/presentation/blocs/auth_state_provider.dart';
import 'package:project_x/src/features/auth_feature/presentation/blocs/forgot_password_page_bloc/forgot_password_page_bloc.dart';
import 'package:project_x/src/features/auth_feature/presentation/blocs/login_page_bloc/login_page_bloc.dart';
import 'package:project_x/src/features/auth_feature/presentation/blocs/register_page_bloc/register_page_bloc.dart';
import 'package:project_x/src/features/auth_feature/presentation/ui/screens/forgot_password_page.dart';
import 'package:project_x/src/features/auth_feature/presentation/ui/screens/login_page.dart';
import 'package:project_x/src/features/auth_feature/presentation/ui/screens/register_page.dart';
import 'package:project_x/src/features/home_feature/home_page.dart';
import 'package:project_x/src/features/profile_feature/domain/usecase/upload_photo_usecase.dart';
import 'package:project_x/src/features/profile_feature/presentation/bloc/user_profile_page_bloc/profile_page_bloc.dart';
import 'package:project_x/src/features/profile_feature/presentation/ui/pages/user_profile_page.dart';

final rootNaveKey = GlobalKey<NavigatorState>(debugLabel: 'rooNav');

abstract class AppRouteConfig {
  static final GoRouter router = GoRouter(
    navigatorKey: rootNaveKey,
    refreshListenable: getIt.get<AuthStateProvider>(),
    initialLocation: AppRoutePaths.homePageRoute.path,
    // redirect: (context, state) {
    //   final fullPath = state.fullPath ?? '';
    //   if (fullPath.isEmpty) {
    //     return;
    //   }
    // },
    routes: [
      GoRoute(
        path: AppRoutePaths.loginPageRoute.path,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              LoginPageBloc(signInUseCase: getIt.get<SignInUseCase>()),
          child: const LoginPage(),
        ),
        routes: [
          GoRoute(
            path: AppRoutePaths.registerPageRoute.path,
            builder: (context, state) {
              return BlocProvider(
                create: (BuildContext context) => RegisterPageBloc(
                  createUserUsecase: getIt.get<CreateUserUseCase>(),
                ),
                child: const RegisterPage(),
              );
            },
          ),
          GoRoute(
            path: AppRoutePaths.forgotPasswordPageRoute.path,
            builder: (context, state) => BlocProvider(
              create: (_) => ForgotPasswordPageBloc(
                sendResetPasswordRequestUseCase:
                    getIt.get<SendResetPasswordRequestUseCase>(),
                confirmPasswordUseCase: getIt.get<ConfirmPasswordUseCase>(),
              ),
              child: const ForgotPasswordPage(),
            ),
          ),
        ],
      ),
      GoRoute(
        path: AppRoutePaths.homePageRoute.path,
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(
            path: AppRoutePaths.profilePageRoute.path,
            redirect: (context, state) {
              final authState = context.read<AuthStateProvider>().state;
              if (authState == AuthState.unauthenticated) {
                return AppRoutePaths.loginPageRoute.fullPath;
              }
              return null;
            },
            builder: (context, state) => BlocProvider(
              create: (_) => ProfilePageBloc(
                logoutUseCase: getIt.get<LogoutUseCase>(),
                uploadPhotoUseCase: getIt.get<UploadPhotoUseCase>(),
              ),
              child: const UserProfilePage(),
            ),
          ),
        ],
      ),
    ],
  );
}
