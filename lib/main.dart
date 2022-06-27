import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'homepage/home.dart';
import './app_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //only portrait orientation is allowed
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'فاستجبنا له',
      //App theme

      theme: AppTheme.darkTheme,
      home:
          const Directionality(textDirection: TextDirection.rtl, child: Home()),
    );
  }
}
