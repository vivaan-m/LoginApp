import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_app_algoworks/Screens/HomePage.dart';
import 'package:login_app_algoworks/Utils/Colors.dart';
import 'package:toast/toast.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = "/SignUpScreen";

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var email = TextEditingController();
  var password = TextEditingController();

  GoogleSignIn googleSignIn = GoogleSignIn();
  FirebaseAuth auth = FirebaseAuth.instance;
  FacebookLogin facebookLogin = FacebookLogin();

  onGoogle() async {
    googleSignIn.signIn().then((account) {
      account.authentication.then((googleAuth) {
        AuthCredential authCredential = GoogleAuthProvider.getCredential(
            idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
        auth.signInWithCredential(authCredential).then((authResult) {
          if (authResult.user != null) {
            shiftReplace(context, HomePage());
          }
        });
      });
    });
  }

  onFacebook() {
    facebookLogin.logIn(["email"]).then((account) {
      AuthCredential authCredential = FacebookAuthProvider.getCredential(
          accessToken: account.accessToken.token);
      auth.signInWithCredential(authCredential).then((value){
        if(value.user!=null){
          shiftReplace(context, HomePage());
        }
      });
    });
  }

  onSignup() {
    if (email.text.isNotEmpty && password.text.isNotEmpty) {
      auth
          .createUserWithEmailAndPassword(
              email: email.text, password: password.text)
          .then((value) {
        if (value.user != null) {
          shiftReplace(context, HomePage());
        }
      }).catchError((e) {
        print(e);
      });
    } else {
      Toast.show(
        "Please Enter Email And Password",
        context,
        duration: Toast.LENGTH_LONG,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      backgroundColor: white(),
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight(context),
          width: screenWidth(context),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        color: blue(),
                        letterSpacing: 1,
                        fontSize: 28,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                inputField(
                    controller: email, hint: "Email", icon: Icon(Icons.email)),
                inputField(
                    controller: password,
                    hint: "Password",
                    obsecure: true,
                    icon: Icon(Icons.vpn_key)),
                SizedBox(
                    height: 45,
                    width: 120,
                    child: FlatButton(
                      onPressed: () {
                        onSignup();
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(color: white(), fontSize: 16),
                      ),
                      color: blue(),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    )),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text("OR"),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 45,
                      width: 180,
                      child: FlatButton(
                        onPressed: () {
                          onGoogle();
                        },
                        child: Text(
                          "Sign Up with Google",
                          style: TextStyle(color: white()),
                        ),
                        color: red(),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    )),
                SizedBox(
                  height: 45,
                  width: 180,
                  child: FlatButton(
                    onPressed: () {
                      onFacebook();
                    },
                    child: Text(
                      "Sign Up with FaceBook",
                      style: TextStyle(color: white()),
                    ),
                    color: bluedark(),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                InkWell(
                  onTap: () {
                    pop(context);
                  },
                  child: Text.rich(
                    TextSpan(
                        text: "Already Registered?",
                        style: TextStyle(
                          color: black(),
                        ),
                        children: [
                          TextSpan(
                              text: " Login ",
                              style: TextStyle(
                                  color: blue(), fontWeight: FontWeight.w800))
                        ]),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
