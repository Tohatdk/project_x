import 'package:project_x/src/features/auth_feature/domain/entities/account_entity.dart';

abstract interface class AccountRepository{
 Future<AccountEntity?> signIn({ required String email,
  required String password,});
 Future<AccountEntity?> createUser({ required String email,
  required String password,});
 Future<void> signOut();
Future<void>confirmPassword({required String newPassword,required String code});
 Future<void>sendResetPassword({required String email});
 }
