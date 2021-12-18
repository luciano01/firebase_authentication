import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthenticationDataSource {
  Future<User?> getUser();

  Future<User> signIn({
    required String email,
    required String password,
  });

  Future<User> getGoogleLogin();

  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> signOut();

  Future<void> disconnect();
}

class AuthenticationDataSourceImpl implements AuthenticationDataSource {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn = GoogleSignIn();

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
  Future<User> getGoogleLogin() async {
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final User? user =
        (await firebaseAuth.signInWithCredential(credential)).user;
    return user!;
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
    await firebaseAuth.signOut();
  }

  @override
  Future<void> disconnect() async {
    await googleSignIn.disconnect();
  }
}
