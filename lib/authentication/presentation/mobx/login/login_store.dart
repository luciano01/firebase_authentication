import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/authentication/presentation/mobx/authentication/authentication_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  final AuthenticationStore authenticationStore;

  _LoginStoreBase({required this.authenticationStore});

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @observable
  bool isVisible = true;

  @action
  setVisibility(bool value) => isVisible = value;

  @observable
  bool loading = false;

  @observable
  String email = '';

  @action
  setEmail(String value) => email = value;

  @observable
  String password = '';

  @action
  setPassword(String value) => password = value;

  @observable
  String? errorMessage;

  @action
  setErrorMessage(String? value) => errorMessage = value;

  String? validateEmail(String? value) {
    if (!(value!.contains('@'))) {
      autoValidateMode = AutovalidateMode.always;
      return 'Invalid Email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value!.length < 3) {
      autoValidateMode = AutovalidateMode.always;
      return 'Invalid Password';
    }
    return null;
  }

  @action
  Future signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    loading = true;
    Future.delayed(const Duration(seconds: 3)).whenComplete(() async {
      try {
        await authenticationStore
            .signInWithEmailAndPassword(email: email, password: password)
            .then((user) async {
          if (user != null) loading = false;
          Modular.to.popUntil((route) => route.isFirst);
          Modular.to.pushReplacementNamed('/home' /* , arguments: user */);
        });
      } on FirebaseAuthException catch (error) {
        loading = false;
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";
            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests. Try again later.";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
      }
    });
  }

  Future signOut() async => await authenticationStore.signOut();
}
