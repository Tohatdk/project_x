import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:project_x/src/features/auth_feature/data/data_source/account_data_source.dart';
import 'package:project_x/src/features/auth_feature/data/repository/account_repository.dart';
import 'package:project_x/src/features/auth_feature/domain/repository/account_repository.dart';
import 'package:project_x/src/features/auth_feature/domain/usecase/confitm_password_reset_usecase.dart';
import 'package:project_x/src/features/auth_feature/domain/usecase/logout_use_case.dart';
import 'package:project_x/src/features/auth_feature/domain/usecase/send_reset_password_request_usecase.dart';
import 'package:project_x/src/features/auth_feature/domain/usecase/sign_in_usecase.dart';
import 'package:project_x/src/features/auth_feature/domain/usecase/get_register_usecase.dart';


final getIt = GetIt.instance;

//dependency injection = di injection = инъекция
//D v SOLID - eto Dependency Inversion Princiре
void setup() {
  ///services
  getIt.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  ///datasources
  getIt.registerFactory<AccountDataSource>(() => AccountDataSource());
  ///repositories
  getIt.registerFactory<AccountRepository>(() => AccountRepositoryImpl(getIt.get<AccountDataSource>()));

  ///authUseCases
  getIt.registerFactory<SignInUseCase>(() => SignInUseCase(getIt.get<AccountRepository>()));
  getIt.registerFactory<CreateUserUseCase>(() => CreateUserUseCase(getIt.get<AccountRepository>()));
  getIt.registerFactory<LogoutUseCase>(() => LogoutUseCase(getIt.get<AccountRepository>()));
  getIt.registerFactory<SendResetPasswordRequestUseCase>(() => SendResetPasswordRequestUseCase(getIt.get<AccountRepository>()));
  getIt.registerFactory<ConfirmPasswordUseCase>(() => ConfirmPasswordUseCase(getIt.get<AccountRepository>()));
}