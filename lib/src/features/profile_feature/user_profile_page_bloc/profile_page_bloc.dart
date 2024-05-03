import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_x/src/features/auth_feature/domain/usecase/logout_use_case.dart';



part 'profile_page_event.dart';
part 'profile_page_state.dart';


class ProfilePageBloc extends Bloc<ProfilePageEvent,ProfilePageState>{
  ProfilePageBloc({required LogoutUseCase logoutUseCase})
      :_logoutUseCase =logoutUseCase,
        super(ProfilePageState('')){
    on<SignoutEvent>(_logout);

  }
  final LogoutUseCase _logoutUseCase;

  Future<void>_logout (SignoutEvent event,Emitter<ProfilePageState>emit)async{
    await _logoutUseCase.signOut();
    emit(ProfilePageState( state.loggedOut));
  }


}
