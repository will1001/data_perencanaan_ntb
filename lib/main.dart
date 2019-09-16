import 'package:data_perencanaan_ntb/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/APIProvider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Data Perencanaan NTB',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ChangeNotifierProvider<APIProvider>(
            builder: (context) => APIProvider(),
            child: SplashScreen(title: 'Data Perencanaan NTB')));
  }
}
