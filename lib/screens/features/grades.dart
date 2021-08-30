import 'package:flutter/material.dart';

class Grades extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Grades'),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
            alignment: Alignment(0, 0),
            image: AssetImage('assets/Grades_Splash.png'),
            fit: BoxFit.fill),
          ),
        )
      );
  }
}

