import 'package:data_perencanaan_ntb/Home.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
SplashScreen({this.title});
final String title;
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
     Future.delayed(Duration(seconds: 5),
    (){
      Navigator.of(context).push(
        MaterialPageRoute(builder: (c) => Home(title:widget.title)));
    },
    
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: (){
          Navigator.of(context).push(
        MaterialPageRoute(builder: (c) => Home(title:widget.title)));
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/BackgroundSplashScreen.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 250.0,
                  height: 250.0,
                  child: FadeInImage.assetNetwork(
                    fadeInDuration: const Duration(seconds: 1),
                    placeholder: 'assets/images/LogoNTB.png',
                    image: 'assets/images/LogoNTB.png',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(27.0),
                  child: Text('Data Perencanaan NTB',
                  style: TextStyle(
                    fontSize: 27.0,
                    color: Colors.white,
                  ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(27.0),
                  child: Text('Dikelola oleh BAPPEDA NTB',
                  style: TextStyle(
                    fontSize: 13.0,
                    color: Colors.white,
                  ),
                  ),
                ),
                CircularProgressIndicator()
              ],
            ),
          ),
        ),
      )
    );
  }
}