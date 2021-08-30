import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:SchoolGate/models/user_asset.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:SchoolGate/services/database.dart';
import 'package:SchoolGate/services/auth.dart';
import 'package:SchoolGate/screens/home/asset_list.dart';

class Timetable extends StatelessWidget {

  final AuthService _auth = AuthService();

  User? currUser;
  String id = '';
  
  void initialiseUser() {
    final FirebaseAuth auth = _auth.getAuth();
    currUser = auth.currentUser;
  }

  String getUserId(User? user) {
    if (user != null) {
      return user.uid.toString();
    } else {
      return '000';
    }
  }

  @override
  Widget build(BuildContext context) {
    initialiseUser();
    DatabaseService db = new DatabaseService(uid: getUserId(currUser));
    return StreamProvider<List<UserAsset>>.value(
      value: db.userAsset,
      initialData: [],
      child: Scaffold(
        appBar: AppBar(
          title: Text('Timetable'),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        body: Container(
          child: AssetList(),
        ),
      ),
    );
  }
}