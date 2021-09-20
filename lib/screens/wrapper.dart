import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:SchoolGate/models/account_user.dart';
import 'package:SchoolGate/screens/authenticate/authenticate.dart';
import 'package:SchoolGate/screens/home/home.dart';

/// Wrapper class to constantly validate log in state.
/// Should be final. -- Joel

class Wrapper extends StatelessWidget {
  const Wrapper({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<AccountUser>(context);

// switch to login in screen if logged out
// switch to home screen if logged in
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
