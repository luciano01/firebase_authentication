// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignupStore on _SignupStoreBase, Store {
  final _$isVisibleAtom = Atom(name: '_SignupStoreBase.isVisible');

  @override
  bool get isVisible {
    _$isVisibleAtom.reportRead();
    return super.isVisible;
  }

  @override
  set isVisible(bool value) {
    _$isVisibleAtom.reportWrite(value, super.isVisible, () {
      super.isVisible = value;
    });
  }

  final _$isCheckAtom = Atom(name: '_SignupStoreBase.isCheck');

  @override
  bool get isCheck {
    _$isCheckAtom.reportRead();
    return super.isCheck;
  }

  @override
  set isCheck(bool value) {
    _$isCheckAtom.reportWrite(value, super.isCheck, () {
      super.isCheck = value;
    });
  }

  final _$loadingAtom = Atom(name: '_SignupStoreBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$emailAtom = Atom(name: '_SignupStoreBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: '_SignupStoreBase.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_SignupStoreBase.errorMessage');

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  final _$createUserWithEmailAndPasswordAsyncAction =
      AsyncAction('_SignupStoreBase.createUserWithEmailAndPassword');

  @override
  Future<dynamic> createUserWithEmailAndPassword(
      {required String email, required String password}) {
    return _$createUserWithEmailAndPasswordAsyncAction.run(() =>
        super.createUserWithEmailAndPassword(email: email, password: password));
  }

  final _$_SignupStoreBaseActionController =
      ActionController(name: '_SignupStoreBase');

  @override
  dynamic setVisibility(bool value) {
    final _$actionInfo = _$_SignupStoreBaseActionController.startAction(
        name: '_SignupStoreBase.setVisibility');
    try {
      return super.setVisibility(value);
    } finally {
      _$_SignupStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCheckTerms(bool value) {
    final _$actionInfo = _$_SignupStoreBaseActionController.startAction(
        name: '_SignupStoreBase.setCheckTerms');
    try {
      return super.setCheckTerms(value);
    } finally {
      _$_SignupStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEmail(String value) {
    final _$actionInfo = _$_SignupStoreBaseActionController.startAction(
        name: '_SignupStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_SignupStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPassword(String value) {
    final _$actionInfo = _$_SignupStoreBaseActionController.startAction(
        name: '_SignupStoreBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_SignupStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setErrorMessage(String? value) {
    final _$actionInfo = _$_SignupStoreBaseActionController.startAction(
        name: '_SignupStoreBase.setErrorMessage');
    try {
      return super.setErrorMessage(value);
    } finally {
      _$_SignupStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isVisible: ${isVisible},
isCheck: ${isCheck},
loading: ${loading},
email: ${email},
password: ${password},
errorMessage: ${errorMessage}
    ''';
  }
}
