import 'package:flutter/material.dart';
import 'package:SchoolGate/screens/authenticate/login_screen.dart';

/// Intermediate class to link to the login screen, should
/// be final. -- Joel

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return LoginScreen();
  }
}