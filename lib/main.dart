import 'package:flutter/material.dart';
import 'file:///F:/Nupul_goyal/Interview/login_app_algoworks/lib/Screens/LoginScreen.dart';

main() {
  return runApp(MainClass());
}

class MainClass extends StatefulWidget {
  static const String routeName = "/MainClass";

  @override
  _MainClassState createState() => _MainClassState();
}

class _MainClassState extends State<MainClass> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Interview Application",
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
