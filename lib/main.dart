import 'package:flutter/material.dart';
import 'package:foodmonkey/Pages/Chat.dart';
import 'package:foodmonkey/Pages/Flash.dart';
import 'package:foodmonkey/Pages/Home.dart';
import 'package:foodmonkey/Pages/Login.dart';
import 'package:foodmonkey/Pages/Record.dart';
import 'package:foodmonkey/utils/Constants.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const Flash(),
        '/home': (context) => const Home(),
        '/record': (context) => const Record(),
        '/chat': (context) => const Chat(),
        '/login': (context) => const Login(),
      },
      theme: ThemeData(
          fontFamily: 'English',
          useMaterial3: true,
          appBarTheme:
              AppBarTheme().copyWith(backgroundColor: Constants.secondary))));
}
