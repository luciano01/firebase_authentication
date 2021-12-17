import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/authentication/presentation/mobx/authentication/authentication_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'signup_store.g.dart';

class SignupStore = _SignupStoreBase with _$SignupStore;

abstract class _SignupStoreBase with Store {
  final AuthenticationStore authenticationStore;

  _SignupStoreBase({required this.authenticationStore});

  @observable
  bool isVisible = true;

  @action
  setVisibility(bool value) => isVisible = value;

  @observable
  bool isCheck = false;

  @action
  setCheckTerms(bool value) => isCheck = value;

  @observable
  bool loading = false;

  @observable
  String email = '';

  @observable
  String password = '';

  @action
  setEmail(String value) => email = value;

  @action
  setPassword(String value) => password = value;

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @observable
  String? errorMessage;

  @action
  setErrorMessage(String? value) => errorMessage = value;

  String? validateEmail(String? value) {
    if (!(value!.contains('@'))) {
      autovalidateMode = AutovalidateMode.always;
      return 'Email invalid';
    } else if (value.isEmpty) {
      autovalidateMode = AutovalidateMode.always;
      return 'Cannot be empty';
    } else {
      return null;
    }
  }

  String? validatePassword(String? value) {
    if (value!.length < 8) {
      autovalidateMode = AutovalidateMode.always;
      return 'Email invalid';
    } else if (value.isEmpty) {
      autovalidateMode = AutovalidateMode.always;
      return 'Cannot be empty';
    } else {
      return null;
    }
  }

  @action
  Future createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    loading = true;
    Future.delayed(const Duration(seconds: 3)).whenComplete(() async {
      try {
        await authenticationStore
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((user) async {
          if (user != null) loading = false;
          Modular.to.popUntil((route) => route.isFirst);
          Modular.to.pushReplacementNamed('/home', arguments: user);
        });
      } on FirebaseAuthException catch (error) {
        loading = false;
        errorMessage = error.message;
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests. Try again later.";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = error.message;
        }
      }
    });
  }
}
