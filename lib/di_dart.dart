import 'package:get_it/get_it.dart';
import 'package:project_x/src/features/auth_feature/data/data_source/account_data_source.dart';
import 'package:project_x/src/features/auth_feature/data/repository/account_repository.dart';
import 'package:project_x/src/features/auth_feature/domain/repository/account_repository.dart';
import 'package:project_x/src/features/auth_feature/domain/usecase/confitm_password_reset_usecase.dart';
import 'package:project_x/src/features/auth_feature/domain/usecase/get_register_usecase.dart';
import 'package:project_x/src/features/auth_feature/domain/usecase/logout_use_case.dart';
import 'package:project_x/src/features/auth_feature/domain/usecase/send_reset_password_request_usecase.dart';
import 'package:project_x/src/features/auth_feature/domain/usecase/sign_in_usecase.dart';
import 'package:project_x/src/features/auth_feature/presentation/blocs/auth_state_provider.dart';
import 'package:project_x/src/features/profile_feature/data/data_source/profile_data_source.dart';
import 'package:project_x/src/features/profile_feature/data/repository/profile_repository.dart';
import 'package:project_x/src/features/profile_feature/domain/repository/profile_repository.dart';
import 'package:project_x/src/features/profile_feature/domain/usecase/upload_photo_usecase.dart';

final getIt = GetIt.instance;

//dependency injection = di injection = инъекция
//D v SOLID - eto Dependency Inversion Princiре
void setup() {
  ///services
  // getIt.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  ///datasources
  getIt.registerFactory<AccountDataSource>(() => AccountDataSource());
  getIt.registerFactory<ProfileDataSource>(() => ProfileDataSource());

  ///repositories
  getIt.registerFactory<AccountRepository>(
    () => AccountRepositoryImpl(getIt.get<AccountDataSource>()),
  );

  getIt.registerFactory<ProfileRepository>(
        () => ProfileRepositoryImpl(getIt.get<ProfileDataSource>()),
  );

  ///authUseCases
  getIt.registerFactory<SignInUseCase>(
    () => SignInUseCase(getIt.get<AccountRepository>()),
  );
  getIt.registerFactory<CreateUserUseCase>(
    () => CreateUserUseCase(getIt.get<AccountRepository>()),
  );
  getIt.registerFactory<LogoutUseCase>(
    () => LogoutUseCase(getIt.get<AccountRepository>()),
  );
  getIt.registerFactory<UploadPhotoUseCase>(
          () => UploadPhotoUseCase(getIt.get<ProfileRepository>())
  );
  getIt.registerFactory<SendResetPasswordRequestUseCase>(
    () => SendResetPasswordRequestUseCase(getIt.get<AccountRepository>()),
  );
  getIt.registerFactory<ConfirmPasswordUseCase>(
    () => ConfirmPasswordUseCase(getIt.get<AccountRepository>()),
  );
  getIt.registerSingleton(AuthStateProvider());
}
