import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:task_manager_app/core/databases/database_helper.dart';
import 'package:task_manager_app/core/di/service_locator.dart';
import 'package:task_manager_app/features/authentication/data/models/login_with_email_and_password_request_body.dart';
import 'package:task_manager_app/features/authentication/data/models/register_with_email_and_password_request_body.dart';

class AuthRepo {
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;

  AuthRepo(this._auth, this._googleSignIn);
  Future<User?> registerWithEmailAndPassword(
      RegisterWithEmailAndPasswordRequestBody body) async {
    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: body.email,
        password: body.password,
      );

      return userCredential.user;
    } catch (e) {
      rethrow;
    }
  }

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return null;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      return userCredential.user;
    } catch (e) {
      rethrow;
    }
  }

  Future<User?> loginWithEmailAndPassword(
      LoginWithEmailAndPasswordRequestBody body) async {
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: body.email,
        password: body.password,
      );
      return userCredential.user;
    } catch (e) {
      rethrow;
    }
  }

  // Sign out
  Future<void> logOut() async {
    try {
      final db = getIt<DatabaseHelper>();
      await db.deleteUser(
        _auth.currentUser!.uid,
      );
      await _auth.signOut();
    } catch (e) {
      rethrow;
    }
  }

  // Get the current signed-in user
  Future<User?> getCurrentUser() async {
    try {
      final User? user = _auth.currentUser;
      if (user != null) {
        return user;
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }
}
