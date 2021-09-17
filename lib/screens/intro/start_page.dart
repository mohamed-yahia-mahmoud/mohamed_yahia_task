

 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mohamed_yahia_task/screens/home.dart';




import 'SplashScreen.dart';


class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  bool isPortrait;
  Widget newWidget;
   @override
  void initState(){
    super.initState();
  }


  @override
  Widget build(BuildContext context) {



     return Scaffold(
      body: new SplashScreen(
          seconds: 4,
          navigateAfterSeconds: Home,
          image: new Image.asset('assets/jplogo.png',fit: BoxFit.fill,),
          backgroundColor: Colors.white,
          styleTextUnderTheLoader: new TextStyle(),
          photoSize: MediaQuery.of(context).size.aspectRatio*120,
      // loaderColor: Colors.red
    ),
    );
  }
}
