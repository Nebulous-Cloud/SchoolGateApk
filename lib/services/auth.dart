import 'package:firebase_auth/firebase_auth.dart';
import 'package:SchoolGate/models/account_user.dart';

/// This is a utility class for auth purpose.
/// Add to it if you want. -- Joel

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseAuth getAuth() {
    return _auth;
  }

  // create user object
  AccountUser? _userFromFirebaseUser(User? user) {
    if(user != null) {
      return AccountUser(uid: user.uid);
    } else {
      return null;
    }
  }

  // auth user stream
  Stream<AccountUser?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  // // sign in anon
  // Future signInAnon() async {
  //   try {
  //     UserCredential result = await _auth.signInAnonymously();
  //     User? user = result.user;
  //     return _userFromFirebaseUser(user);
  //   } catch(e) {
  //     print(e.toString());
  //     return null;
  //   }
  // }

  // sign in with email and pass
  Future signInWithEmailAndPass (String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch(e) {
      print(e.toString());
      return null;
    }
  }
}
