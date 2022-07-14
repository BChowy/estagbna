import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get darkTheme {
    const primeColor = Color(0xFF668386);
    const darkColor = Color(0xFF38383A);

    return ThemeData.dark().copyWith(
      appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
      primaryColor: primeColor,
      primaryColorDark: darkColor,

      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        onPrimary: primeColor,
        primary: darkColor,
        elevation: 10,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      )),

      textTheme: TextTheme(
              headline1: const TextStyle(
                fontFamily: 'Uthman',
                fontSize: 48,
              ).apply(color: Colors.white),
              headline5: const TextStyle(fontFamily: 'Uthman', fontSize: 18),
              headline6: const TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              bodyText1: const TextStyle(
                  fontFamily: 'Janna',
                  fontSize: 16,
                  fontWeight: FontWeight.normal),
              bodyText2: const TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 16,
                  fontWeight: FontWeight.normal),
              button: const TextStyle(fontFamily: 'Cairo', fontSize: 15),
              caption: const TextStyle(
                  color: primeColor,
                  fontFamily: 'Cairo',
                  fontSize: 12,
                  fontWeight: FontWeight.w700))
          .apply(
        bodyColor: Colors.white,
        //displayColor: Colors.white
      ), //set font color to white globally
    );
  }

  static ThemeData get lightTheme {
    const primeColor = Color(0xFF668386);
    const darkColor = Color(0xFF38383A);
    const lightColor = Color(0xFFDEE4E7);

    return ThemeData.light().copyWith(
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          actionsIconTheme: IconThemeData(color: darkColor)),
      primaryColor: primeColor,
      primaryColorDark: darkColor,
      primaryColorLight: lightColor,
      scaffoldBackgroundColor: lightColor,

      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        onPrimary: primeColor,
        primary: Colors.white,
        elevation: 10,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      )),

      textTheme: TextTheme(
          headline1: const TextStyle(
            fontFamily: 'Uthman',
            fontSize: 48,
          ).apply(color: darkColor),
          headline5: const TextStyle(fontFamily: 'Uthman', fontSize: 18),
          headline6: const TextStyle(
              fontFamily: 'Cairo', fontSize: 16, fontWeight: FontWeight.bold),
          bodyText1: const TextStyle(
              fontFamily: 'Janna', fontSize: 16, fontWeight: FontWeight.normal),
          bodyText2: const TextStyle(
              fontFamily: 'Cairo', fontSize: 16, fontWeight: FontWeight.normal),
          button: const TextStyle(fontFamily: 'Cairo', fontSize: 15),
          caption: const TextStyle(
              color: primeColor,
              fontFamily: 'Cairo',
              fontSize: 12,
              fontWeight: FontWeight.w700)), //set font color to white globally
    );
  }
}
