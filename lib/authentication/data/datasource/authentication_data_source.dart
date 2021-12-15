import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationDataSource {
  Future<User?> getUser();

  Future<User> signIn({
    required String email,
    required String password,
  });

  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> signOut();
}

class AuthenticationDataSourceImpl implements AuthenticationDataSource {
  final FirebaseAuth firebaseAuth;

  AuthenticationDataSourceImpl({required this.firebaseAuth});

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
