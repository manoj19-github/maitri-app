// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:maitri_app/login/widgets/GoogleSignBtn.dart';
import 'package:maitri_app/login/widgets/logoutBtn.dart';
import "package:powersync_repository/powersync_repository.dart";
import 'package:flex_color_scheme/flex_color_scheme.dart';

import 'package:shared/shared.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:supabase_auth_ui/supabase_auth_ui.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    void showSnackbar(String message) {
      final snackBar = SnackBar(
        content: Text(message, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.redAccent,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    // final FirebaseAuth _auth = FirebaseAuth.instance;
    final GoogleSignIn _googleSignIn = GoogleSignIn();

    Future<String?> signInwithGoogle() async {
      try {
        final GoogleSignInAccount? googleSignInAccount =
            await _googleSignIn.signIn();
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount!.authentication;
        if (googleSignInAuthentication == null) {
          showSnackbar("Google Sign in was cancelled");
          return "Google Sign in was cancelled";
        }
        if (googleSignInAuthentication.accessToken == null) {
          showSnackbar("Access Token is not found");
          return "Access Token is not found";
        }
        if (googleSignInAuthentication.idToken == null) {
          showSnackbar("Id Token is not found");
          return "Id Token is not found";
        }
        // final AuthCredential credential = GoogleAuthProvider.credential(
        //   accessToken: googleSignInAuthentication.accessToken,
        //   idToken: googleSignInAuthentication.idToken,
        // );
        // ignore: lines_longer_than_80_chars
        await Supabase.instance.client.auth.signInWithIdToken(
            provider: OAuthProvider.google,
            idToken: googleSignInAuthentication.idToken!);
        // await _auth.signInWithCredential(credential);
      } catch (error, stackTrace) {
        // print(e.message);
        logE("Failed to login", error: error, stackTrace: stackTrace);
        showSnackbar("Something went wrong");
      }
    }

    void googleSignInHandler() async {
      try {
        await signInwithGoogle();
      } catch (error) {}
    }

    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              Googlesignbtn(onPressed: googleSignInHandler),
              SizedBox(height: 16),
              LogoutBtn()
            ])),
      ),
    );
  }
}
