import 'package:SchoolGate/screens/features/chatbot/chat.dart';
import 'package:SchoolGate/screens/features/grades/grades.dart';
import 'package:SchoolGate/screens/features/schedule/schedule.dart';
import 'package:SchoolGate/screens/features/timetable/timetable.dart';
import 'package:SchoolGate/utilities/iconList.dart';
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

  User currUser;
  String id = '';
  
  void initialiseUser() {
    final FirebaseAuth auth = _auth.getAuth();
    currUser = auth.currentUser;
  }

  String getUserId(User user) {
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
              ElevatedButton.icon(
                  icon: Icon(Icons.logout,
                      color: Colors.white
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.teal),
                    foregroundColor: MaterialStateProperty.all(Colors.teal),
                    fixedSize: MaterialStateProperty.all(
                      Size.fromRadius(70),
                    ),
                  ),

                  onPressed: () async {
                    await _auth.signOut();
                  },
                  label: Text('SignOut')
              ),
          ],
        ),
        body: Container(
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(20.0, 100.0, 20.0, 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                    children: <Widget> [

                      ElevatedButton.icon(

                          icon:
                          IconFont(
                            color: Colors.black,
                            iconName: IconList.TIMETABLE,
                            size: 40,
                          ),

                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.teal),
                            foregroundColor: MaterialStateProperty.all(Colors.white),
                            fixedSize: MaterialStateProperty.all(
                              Size.fromRadius(70),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Timetable()),
                            );
                          },
                          label: Text('Timetable')
                      ),
                      ElevatedButton.icon(

                          icon:
                          IconFont(
                            color: Colors.black,
                            iconName: IconList.GRADES,
                            size: 40,
                          ),
                          // Icon(Icons.calendar_today_rounded
                          // ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.white),
                            foregroundColor: MaterialStateProperty.all(Colors.teal),
                            fixedSize: MaterialStateProperty.all(
                              Size.fromRadius(70),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Grades()),
                            );
                          },
                          label: Text('Grades')
                      ),
                    ]
                ),
                Column(

                    children: <Widget> [
                      ElevatedButton.icon(

                          icon:
                          IconFont(
                            color: Colors.black,
                            iconName: IconList.SCHEDULE,
                            size: 40,
                          ),
                          // Icon(Icons.calendar_today_rounded
                          // ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.white),
                            foregroundColor: MaterialStateProperty.all(Colors.teal),
                            fixedSize: MaterialStateProperty.all(
                              Size.fromRadius(70),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Schedule()),
                            );
                          },
                          label: Text('Schedule')
                      ),
                      ElevatedButton.icon(

                          icon:
                          IconFont(
                            color: Colors.black,
                            iconName: IconList.CHAT,
                            size: 40,
                          ),
                          // Icon(Icons.calendar_today_rounded
                          // ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.teal),
                            foregroundColor: MaterialStateProperty.all(Colors.white),
                            fixedSize: MaterialStateProperty.all(
                              Size.fromRadius(70),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Chat()),
                            );
                          },
                          label: Text('Chat')
                      ),
                    ]
                ),
                // AssetList()
              ],
            ),
          ),
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
        String text,
        IconData icon
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

class IconFont extends StatelessWidget {

  Color color;
  double size;
  String iconName;

  IconFont({this.color, this.size, this.iconName});

  @override
  Widget build(BuildContext context) {
    return Text(this.iconName,
      style: TextStyle(
        color: this.color,
        fontSize: this.size,
        fontFamily: 'sgate'
      ),
    );
  }
}

