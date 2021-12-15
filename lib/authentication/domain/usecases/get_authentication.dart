import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/authentication/domain/repositories/authentication_repository.dart';

class GetAuthentication implements AuthenticationRepository {
  final AuthenticationRepository repository;

  GetAuthentication({required this.repository});

  @override
  Future<User?> getUser() {
    return repository.getUser();
  }

  @override
  Future<User> signIn({
    required String email,
    required String password,
  }) {
    return repository.signIn(
      email: email,
      password: password,
    );
  }

  @override
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    return repository.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> logOut() {
    return repository.logOut();
  }
}
