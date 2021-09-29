import 'package:flutter/material.dart';
import 'SplashScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String title = 'Text Recognition';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        // theme: ThemeData(primarySwatch: Colors.lightBlue),
        // home: MainPage(title: title),
        home: SplashScreen(),
      );
}
