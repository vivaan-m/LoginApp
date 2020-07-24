import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_app_algoworks/Screens/LoginScreen.dart';
import 'package:login_app_algoworks/Utils/Colors.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "/HomePage";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: screenWidth(context),
        height: screenHeight(context),
        child: Center(
          child: FlatButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            onPressed: () {
              FirebaseAuth.instance.signOut();
              shiftReplace(context, LoginScreen());
            },
           color: blue(),
            child: Text("Logout",style: TextStyle(color: white()),),
          ),
        ),
      ),
    );
  }


}
