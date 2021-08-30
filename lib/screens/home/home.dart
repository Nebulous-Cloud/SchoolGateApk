import 'package:SchoolGate/screens/features/chat.dart';
import 'package:SchoolGate/screens/features/grades.dart';
import 'package:SchoolGate/screens/features/schedule.dart';
import 'package:SchoolGate/screens/features/timetable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:SchoolGate/services/auth.dart';
import 'package:SchoolGate/services/database.dart';
import 'package:provider/provider.dart';
import 'package:SchoolGate/models/user_asset.dart';

/// Please replace this with the home screen others have made.
/// I did not spend time doing this. -- Joel

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  ///
  /// do not touch -- Joel
  ///

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
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text('Welcome'),
          centerTitle: true,
          backgroundColor: Colors.teal,
          actions: <Widget>[
            ElevatedButton(
              onPressed: () async {
                await _auth.signOut();
              },
              child: Text('Sign out')
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: <Widget> [
                  ElevatedButton(
                      onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Timetable()),
                          );
                      },
                      child: Text('Timetable')
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Grades()),
                        );
                      },
                      child: Text('Grades')
                  ),
                  ]
              ),
              Column(
                  children: <Widget> [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Schedule()),
                        );
                        },
                        child: Text('Schedule')
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Chat()),
                        );
                        },
                        child: Text('Chat')
                    ),
                  ]
              ),
              // AssetList()
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          child: Text(''),
          backgroundColor: Colors.teal,
        ),
      ),
    );
  }
}

class NavigationDrawerWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) => Drawer(
    child: Container(
      color: Colors.teal,
      child: ListView(
        children: <Widget>[
          Column(
            children: [
              const SizedBox(height: 100),
              buildMenuItem(
                context,
                text: 'Your Profile',
                icon: Icons.account_box
              ),
              const SizedBox(height: 24),
              Divider(color: Colors.white70),
              const SizedBox(height: 24),
              buildMenuItem(
                  context,
                  text: 'Settings',
                  icon: Icons.settings,
              ),
            ],
          )
        ],
      ),
    ),
  );

  buildMenuItem(
      BuildContext context, {
        required String text,
        required IconData icon
        }
      ) {
    final color = Colors.white;
    return Material(
      color: Colors.transparent,
      child: ListTile(
        leading: Icon(icon, color: color),
        title: Text(text, style: TextStyle(color: color, fontSize: 20)),
        onTap: () {},
      ),
    );
  }
}
