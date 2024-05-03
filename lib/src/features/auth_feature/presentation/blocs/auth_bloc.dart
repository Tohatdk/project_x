import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

enum AuthState { authenticated, unauthenticated }

class AuthBloc {
  AuthBloc() {
    _initAuthStateListener();
  }

  final _userStreamController = StreamController<AuthState>.broadcast();

  Stream<AuthState> get state => _userStreamController.stream;

  void _initAuthStateListener() {
    FirebaseAuth.instance.authStateChanges().listen(
      (User? user) {
        if (user == null) {
          _emitState(AuthState.unauthenticated);
        } else {
          _emitState(AuthState.authenticated);
        }
      },
      onError: (error) {},
    );
  }

  void _emitState(AuthState state) {
    if (!_userStreamController.isClosed) {
      _userStreamController.add(state);
    }
  }

  void dispose() {
    _userStreamController.close();
  }
}
