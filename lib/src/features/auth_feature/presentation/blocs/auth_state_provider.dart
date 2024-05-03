import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

enum AuthState { authenticated, unauthenticated }

class AuthStateProvider extends ChangeNotifier {
  AuthState _state = AuthState.unauthenticated;

  AuthState get state => _state;

  AuthStateProvider() {
    _initAuthStateListener();
  }

  void _initAuthStateListener() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      _state = user == null ? AuthState.unauthenticated : AuthState.authenticated;
      print(_state);
      notifyListeners();
    }, onError: (error) {
      print('Error in authentication stream: $error');
    });
  }
}
