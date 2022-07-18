import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'homepage/home.dart';
import 'theme/app_themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  bool dark = true;

  void changeTheme(bool isDark) {
    setState(() {
      dark = isDark;
    });
  }

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future _darkF;

  saveTheme() async {
    SharedPreferences pref = await _prefs;
    pref.setBool('theme', dark);
  }

  _getTheme() async {
    _darkF = _prefs.then((SharedPreferences prefs) {
      return prefs.getBool('theme') ?? true;
    });
    dark = await _darkF;
  }

  @override
  void initState() {
    super.initState();
    _getTheme();
  }

  @override
  Widget build(BuildContext context) {
    //only portrait orientation is allowed
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', ''), // Arabic, no country code
      ],
      locale: const Locale("ar", ''),
      title: 'فاستجبنا له',
      theme: dark ? AppTheme.darkTheme : AppTheme.lightTheme,
      //darkTheme: AppTheme.darkTheme,
      home: const Home(),
    );
  }
}
