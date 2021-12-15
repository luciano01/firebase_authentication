import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/authentication/data/datasource/authentication_data_source.dart';
import 'package:firebase_authentication/authentication/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationDataSource dataSource;

  AuthenticationRepositoryImpl({required this.dataSource});

  @override
  Future<User?> getUser() async {
    return dataSource.getUser();
  }

  @override
  Future<User> signIn({
    required String email,
    required String password,
  }) async {
    return await dataSource.signIn(
      email: email,
      password: password,
    );
  }

  @override
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return await dataSource.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> signOut() async {
    return await dataSource.signOut();
  }
}
