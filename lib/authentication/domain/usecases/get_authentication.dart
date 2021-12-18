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
  Future<User> getGoogleLogin() async {
    return await repository.getGoogleLogin();
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
  Future<void> signOut() {
    return repository.signOut();
  }

  @override
  Future<void> disconnect() {
    return repository.disconnect();
  }
}
