import 'package:flutter/material.dart';

/*

checkDarkMode() async {
SharedPreferences preferences = await SharedPreferences.getInstance();
Global.darkMode = preferences.getBool("DarkMode")==null?false:preferences.getBool("DarkMode");
}
*/


white() => Global.darkMode?Colors.black:Colors.white;

blue() => Colors.blue;

black() => Global.darkMode?Colors.white:Colors.black;

red() => Colors.red;

green() => Colors.green;

bluedark() => Colors.blue[900];

whiteLess() => Colors.white30;

yellow() => Colors.yellow;

blackLess() => Colors.black38;

fadedBlack() => Colors.black87;

transparent() => Colors.transparent;

screenHeight(context) => MediaQuery.of(context).size.height;

screenWidth(context) => MediaQuery.of(context).size.width;

Widget socialButtons(name, color,onPress) => SizedBox(
  height: 45,
  width: 180,
  child: FlatButton(
    onPressed: (){
      onPress();
    },
    child: Text(
      name,
      style: TextStyle(color: white()),
    ),
    color: color,
    shape:
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  ),
);

inputField({hint,controller,icon,obsecure = false})=>Padding(
  padding: const EdgeInsets.all(12.0),
  child: TextField(
    obscureText: obsecure,
    controller: controller,
    decoration: InputDecoration(
      hintText: hint,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10)),
      prefixIcon: icon,
    ),
  ),
);



pop(context) => Navigator.pop(context);
shift(context,route)=> Navigator.push(context, MaterialPageRoute(builder: (context) => route,));
shiftReplace(context,route)=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => route,));

class Global {
  static bool showProfile = false;
  static bool showMore = false;

  static bool darkMode = false;

}
