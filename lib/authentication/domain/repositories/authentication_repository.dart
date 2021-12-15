import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationRepository {
  Future<User?> getUser();

  Future<User> signIn({
    required String email,
    required String password,
  });

  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> logOut();
}
