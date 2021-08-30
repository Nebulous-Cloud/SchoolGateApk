import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:SchoolGate/models/account_user.dart';
import 'package:SchoolGate/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:SchoolGate/services/auth.dart';

/// Entrypoint, please becareful -- Joel

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        return StreamProvider<AccountUser?>.value(
          value: AuthService().user,
          initialData: null,
          child: MaterialApp(
            home: Wrapper(),
            ),
        );
      },
    );
  }
}
