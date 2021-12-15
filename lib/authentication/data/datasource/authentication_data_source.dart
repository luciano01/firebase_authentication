import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/authentication/domain/repositories/authentication_repository.dart';

class AuthenticationDataSource implements AuthenticationRepository {
  final FirebaseAuth firebaseAuth;

  AuthenticationDataSource({required this.firebaseAuth});

  @override
  Future<User?> getUser() async {
    return firebaseAuth.currentUser;
  }

  @override
  Future<User> signIn({
    required String email,
    required String password,
  }) async {
    final user = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return user.user!;
  }

  @override
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final user = await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return user.user!;
  }

  @override
  Future<void> signOut() async {
    return await firebaseAuth.signOut();
  }
}
