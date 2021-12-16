import 'package:firebase_authentication/authentication/presentation/mobx/authentication/authentication_store.dart';
import 'package:firebase_authentication/core/authentication_enum/authentication_status.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'launch_store.g.dart';

class LaunchStore = _LaunchStoreBase with _$LaunchStore;

abstract class _LaunchStoreBase with Store {
  final AuthenticationStore authenticationStore;

  _LaunchStoreBase({required this.authenticationStore});

  void checkIfUserIsLogged() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      if (authenticationStore.authenticationStatus ==
          AuthenticationStatus.logged) {
        Modular.to.pushReplacementNamed('/home');
      } else if (authenticationStore.authenticationStatus ==
          AuthenticationStatus.logoff) {
        Modular.to.pushReplacementNamed('/login');
      }
    });
  }
}
