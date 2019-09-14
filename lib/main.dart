import 'package:data_perencanaan_ntb/SplashScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Data Perencanaan NTB',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(title:'Data Perencanaan NTB')
    );
  }
}