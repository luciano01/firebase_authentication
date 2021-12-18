import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/authentication/domain/usecases/get_authentication.dart';
import 'package:firebase_authentication/core/authentication_enum/authentication_status.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part '../authentication_store.g.dart';

class AuthenticationStore = _AuthenticationStoreBase with _$AuthenticationStore;

abstract class _AuthenticationStoreBase with Store {
  final GetAuthentication usecase;

  _AuthenticationStoreBase({required this.usecase}) {
    usecase.getUser().then((setUser));
  }

  @observable
  AuthenticationStatus authenticationStatus = AuthenticationStatus.loading;

  @observable
  User? user;

  @action
  setUser(User? value) {
    user = value;
    authenticationStatus = user == null
        ? AuthenticationStatus.logoff
        : AuthenticationStatus.logged;
  }

  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    user = await usecase.signIn(email: email, password: password);

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = user!.getIdToken();
    token.then((token) {
      sharedPreferences.setString('token', token);
    });
    return user;
  }

  Future<User> getGoogleLogin() async {
    user = await usecase.getGoogleLogin();
    return user!;
  }

  Future<User?> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    user = await usecase.createUserWithEmailAndPassword(
        email: email, password: password);

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = user!.getIdToken();
    token.then((value) {
      sharedPreferences.setString('token', value);
    });
    return user;
  }

  Future signOut() async {
    await usecase.signOut().whenComplete(() {
      user = null;
    });
  }

  Future disconnect() async {
    await usecase.disconnect().whenComplete(() {
      user = null;
    });
  }
}
