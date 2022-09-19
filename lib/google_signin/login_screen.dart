import 'package:crud/google_signin/login_home.dart';
import 'package:crud/google_signin/profilepage.dart';
import 'package:crud/google_signin/provider/provider.dart';
//import 'package:crud/screens/login/provier/provider.dart';
import 'package:crud/screens/view_data.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //final FirebaseAuth _auth = FirebaseAuth.instance;
  //final GoogleSignIn _googleSignIn = GoogleSignIn();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginPage'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const FlutterLogo(size: 160),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    onPrimary: Colors.yellow, primary: Colors.blue),
                onPressed: () {
                  final provider =
                      Provider.of<GoogleSigninProvider>(context, listen: false);
                  provider.googleLogin();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginHome()));
                },
                icon: const Icon(
                  FontAwesomeIcons.google,
                  color: Colors.red,
                ),
                label: const Text('signin with google'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
