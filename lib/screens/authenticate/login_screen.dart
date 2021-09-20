import 'package:SchoolGate/utilities/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:SchoolGate/services/auth.dart';
import 'package:SchoolGate/utilities/constants.dart';

/// Login screen
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final AuthService _auth = AuthService();
  bool loading = false;

  String email = '';
  String pass = '';
  String error = '';

  bool _rememberMe = false;

  // Email user input
  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: loginLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: loginDetailBoxStyle,
          height: 60.0,
          child: TextField(
            onChanged: (String value) {
              email = value;
            },
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.teal,
              ),
              hintText: '',
              hintStyle: loginTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  // Password user input
  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: loginLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: loginDetailBoxStyle,
          height: 60.0,
          child: TextField(
            onChanged: (String value) {
              pass = value;
            },
            obscureText: true,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.teal,
              ),
              hintText: '',
              hintStyle: loginTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  // Forget password button
  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => print('Forgot Password Button Pressed'),
        // padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Forgot Password?',
          style: loginLabelStyle,
        ),
      ),
    );
  }

  // Check box for remembering password
  Widget _buildRememberMeCheckbox() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.tealAccent),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.teal,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _rememberMe = !_rememberMe;
                });
              },
            ),
          ),
          Text(
            'Remember me',
            style: loginLabelStyle,
          ),
        ],
      ),
    );
  }

  // Alert widget when login failed
  Widget showAlert() {
    if (error != '') {
      return Container(
        color: Colors.redAccent,
        width: double.infinity,
        height: 100.0,
        padding: EdgeInsets.only(top: 15, bottom: 10),
        child: Row(
          children: <Widget>[
            Icon(Icons.error_outline),
            Expanded(
              child: Text(
                error,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0
                ),
              )
            )
          ]
        )
      );
    }
    return SizedBox(height: 0,);
  }

  // Login button
  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          setState(() => loading = true);
          dynamic result = await _auth.signInWithEmailAndPass(email, pass);
          if (result == null) {
            setState(() => error = 'Could Not Log In');
            setState(() => loading = false);
          }
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.tealAccent
        ),
        child: Text(
          'SIGN IN',
          style: TextStyle(
            color: Colors.teal,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.teal,
                  ),
                ),
                showAlert(),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'SchoolGate',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      _buildEmailTF(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _buildPasswordTF(),
                      _buildForgotPasswordBtn(),
                      _buildRememberMeCheckbox(),
                      _buildLoginBtn(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
