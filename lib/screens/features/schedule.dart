import 'package:flutter/material.dart';

class Schedule extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Schedule'),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
            alignment: Alignment(0, 0),
            image: AssetImage('assets/Schedule_Splash.png'),
            fit: BoxFit.fill),
          ),
        )
      );
  }
}