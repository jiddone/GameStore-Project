import 'package:flutter/material.dart';
import 'package:frontend/pages/PurchaseSuccesfull.dart';
import 'package:frontend/pages/SearchByTitle.dart';

import 'package:frontend/Auth/login.dart';
import 'package:frontend/pages/dashboard.dart';

import 'Objects/User.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Color.fromRGBO(54, 89, 241, 1.0),
        )),
    debugShowCheckedModeBanner: false,
    home: Login(),
  ));
}
