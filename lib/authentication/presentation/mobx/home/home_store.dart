import 'package:firebase_authentication/authentication/presentation/mobx/authentication/authentication_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final AuthenticationStore authenticationStore;

  _HomeStoreBase({required this.authenticationStore});

  void signOut() async {
    await authenticationStore.signOut().then((_) {
      Modular.to.pushReplacementNamed('/authentication');
    });
  }

  void disconnect() async {
    await authenticationStore.disconnect().then((_) {
      Modular.to.pushReplacementNamed('/authentication');
    });
  }
}
