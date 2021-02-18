import 'package:flutter/material.dart';
import 'package:mahal_webview/Home.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        accentColor: Colors.red
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
