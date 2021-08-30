import 'package:flutter/material.dart';

/// This is a class to store all the constants for
/// styles and deco. Add your default styles here for
/// homescreen too. -- Joel

final loginTextStyle = TextStyle(
  color: Colors.black,
  fontFamily: 'OpenSans',
);

final loginLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final loginDetailBoxStyle = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);