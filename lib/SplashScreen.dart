import 'package:data_perencanaan_ntb/Home.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

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
     Future.delayed(Duration(seconds: 1),
    (){
      Navigator.of(context).push(
        MaterialPageRoute(builder: (c) => Home(title:widget.title)));
    },
    
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://images.pexels.com/photos/953214/pexels-photo-953214.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
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
                child: FadeInImage.memoryNetwork(
                  fadeInDuration: const Duration(seconds: 1),
                  placeholder: kTransparentImage,
                  image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Coat_of_arms_of_West_Nusa_Tenggara.svg/1200px-Coat_of_arms_of_West_Nusa_Tenggara.svg.png',
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
            ],
          ),
        ),
      )
    );
  }
}