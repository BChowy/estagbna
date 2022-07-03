import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get darkTheme {
    const primeColor = Color(0xFF668386);
    const secondColor = Color(0xFF52696B);
    const btnColor = Color(0xFF38383A);
  
    return ThemeData.dark().copyWith(
      appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
      primaryColor: primeColor,
      cardColor: secondColor,
      primaryColorDark: btnColor,

      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(onPrimary: primeColor,
        primary: btnColor,
        elevation: 10,
        
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      )),

      textTheme: const TextTheme(
              headline1: TextStyle(
                fontFamily: 'Uthman',
                fontSize: 48,
                
              ),
              headline5: TextStyle(fontFamily: 'Uthman', fontSize: 18),
              headline6: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              bodyText1: TextStyle(
                  fontFamily: 'Janna',
                  fontSize:
                      16), 
              //bodyText2: TextStyle(fontFamily: , fontSize: , fontWeight: FontWeight.bold),
              button: TextStyle(fontFamily: 'Cairo', fontSize: 15),
              caption: TextStyle(color: primeColor,
                  fontFamily: 'Cairo',
                  fontSize: 12,
                  fontWeight: FontWeight.w500))
          .apply(
              bodyColor: Colors.white,
              displayColor: Colors.white), //set font color to white globally
    );
  }
}
